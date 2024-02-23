import Vapor
import Fluent

struct AdminMiddleware : AsyncMiddleware {

    func respond(to req: Request, chainingTo next: AsyncResponder) async throws -> Response {
        guard let vaporPublic = Environment.get("VAPOR_SERVER_PUBLIC_URL") else {
                fatalError("Failed to determine VAPOR_SERVER_PUBIC_URL from environment");
        }
                    
        guard let user = req.auth.get(User.self) else {
            // is not authenticated as either a student or faculty member
            let redirect = req.redirect(to: vaporPublic + "/login?redirect=\(req.url.path)");
            return redirect;
        }

        if (user.userType != .admin) {
            // Is a teacher, student, or unverified. not an admin
            let redirect = req.redirect(to: vaporPublic + "/dashboard");
            return redirect;
        }

        return try await next.respond(to: req);
    }
    
}
