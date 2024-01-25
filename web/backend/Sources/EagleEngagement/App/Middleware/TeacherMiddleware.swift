import Vapor
import Fluent

struct TeacherMiddleware : AsyncMiddleware {

    func respond(to req: Request, chainingTo next: AsyncResponder) async throws -> Response {
        guard let user = req.auth.get(User.self) else {
            throw Abort(.unauthorized);
        }

        if (user.userType != .teacher && user.userType != .admin) {
            throw Abort(.unauthorized);
        }

        return try await next.respond(to: req);
    }
    
}
