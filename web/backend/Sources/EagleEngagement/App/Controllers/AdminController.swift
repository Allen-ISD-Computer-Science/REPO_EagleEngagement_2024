import Vapor

struct AdminController : RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let adminRoutes = routes.grouped("admin");
        let sessionRoutes = adminRoutes.grouped([User.sessionAuthenticator(), UserAuthenticator()])
        let adminProtectedRoutes = sessionRoutes.grouped(AdminMiddleware());

        adminProtectedRoutes.get("events", use: serveIndex);
        adminProtectedRoutes.get("events", "new", use: serveIndex);
        adminProtectedRoutes.get("events", "edit", ":id", use:serveIndex);
        
        adminProtectedRoutes.get("locations", use: serveIndex);
        adminProtectedRoutes.get("locations", "new", use: serveIndex);
        adminProtectedRoutes.get("locations", "edit", ":id", use:serveIndex);
        
        adminProtectedRoutes.get("event-requests", use: serveIndex);
        adminProtectedRoutes.get("review-checkins", use: serveIndex);
        adminProtectedRoutes.get("review-missing-points", use: serveIndex);
    }

    func serveIndex(_ req: Request) async throws -> View {
        return try await req.view.render("index.html")
    }

    
}
