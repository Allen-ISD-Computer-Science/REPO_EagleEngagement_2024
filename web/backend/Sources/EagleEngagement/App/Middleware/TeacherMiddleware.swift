import Vapor
import Fluent

struct TeacherMiddleware : AsyncMiddleware {

    func respond(to req: Request, chainingTo next: AsyncResponder) async throws -> Response {
        guard let user = req.auth.get(User.self) else {
            // is not authenticated at all
            guard let vaporPublic = Environment.get("VAPOR_SERVER_PUBLIC_URL") else {
                fatalError("Failed to determine VAPOR_SERVER_PUBIC_URL from environment");
            }
            
            let redirect = req.redirect(to: vaporPublic + "/login?redirect=\(req.url.path)");
            return redirect;
        }

        if (user.userType != .teacher && user.userType != .admin) {
            // is a student or unverified
            throw Abort(.unauthorized);
        }

        return try await next.respond(to: req);
    }
    
}
