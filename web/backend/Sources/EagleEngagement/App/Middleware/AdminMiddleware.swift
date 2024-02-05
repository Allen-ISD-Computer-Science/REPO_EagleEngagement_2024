import Vapor
import Fluent

struct AdminMiddleware : AsyncMiddleware {

    func respond(to req: Request, chainingTo next: AsyncResponder) async throws -> Response {
        guard let user = req.auth.get(User.self) else {
            throw Abort(.unauthorized);
        }

        if (user.userType != .admin) {
            throw Abort(.unauthorized);
        }

        return try await next.respond(to: req);
    }
    
}