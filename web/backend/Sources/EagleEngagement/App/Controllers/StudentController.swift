import Vapor
import Fluent
import Foundation

struct StudentController : RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let apiRoutes = routes.grouped("api");
        let protectedRoutes = apiRoutes.grouped([StudentUserAuthenticator(), UserToken.guardMiddleware()])

        protectedRoutes.get("events", use: fetchEvents);
    }
    
    func fetchEvents(_ req: Request) async throws -> [Events] {
        let currentDate = Date()
        
        let events = try await Events.query(on: req.db)
          .join(Location.self, on: \Events.$locationID == \Location.$id)
          .filter(Events.self, \.$startDate >= currentDate)
          .sort(Events.self, \.$startDate)
          .field(Events.self, \.$id)
          .field(Events.self, \.$name)
          .field(Location.self, \.$locationName)
          .field(Events.self, \.$pointsWorth)
          .field(Events.self, \.$startDate)
          .field(Events.self, \.$endDate)
          .all()
        
        return events;
    }

    
}
