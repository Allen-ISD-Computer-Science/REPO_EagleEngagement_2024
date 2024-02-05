import Vapor
import Fluent
import Foundation

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

        let apiRoutes = adminProtectedRoutes.grouped("api");
    }

    func serveIndex(_ req: Request) async throws -> View {
        return try await req.view.render("index.html")
    }

    struct EventsQuery : Content {
        var includePast: Bool;
    }

    struct EventInfo : Content {
        var id: Int;
        var name: String;
        var eventType: String;
        var locationID: Int;
        var locationName: String;
        var pointsWorth: Int;
        var startDate: Date;
        var endDate: Date;
    }

    func events(_ req: Request) async throws -> [EventInfo] {
        let eventsQuery = try req.content.decode(EventsQuery.self);
        let includePast = eventsQuery.includePast;
               
        if (includePast) {
            let events = try await Events.query(on: req.db)
              .join(Location.self, on: \Events.$location.$id == \Location.$id)
              .sort(Events.self, \.$startDate)
              .all()
              .map { ev in
                  return EventInfo.init(id: ev.id!, name: ev.name, eventType: ev.eventType, locationID: ev.location.id!, locationName: ev.location.locationName, pointsWorth: ev.pointsWorth, startDate: ev.startDate, endDate: ev.endDate)
              };

            return events;
        } else {
            let currentDate = Date()

            let events = try await Events.query(on: req.db)
              .join(Location.self, on: \Events.$location.$id == \Location.$id)
              .filter(Events.self, \.$endDate >= currentDate)
              .sort(Events.self, \.$startDate)
              .all()
              .map { ev in
                  return EventInfo.init(id: ev.id!, name: ev.name, eventType: ev.eventType, locationID: ev.location.id!, locationName: ev.location.locationName, pointsWorth: ev.pointsWorth, startDate: ev.startDate, endDate: ev.endDate)
              };
            
            return events;
        }
    }
    
}
