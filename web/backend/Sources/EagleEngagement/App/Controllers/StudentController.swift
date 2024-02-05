import Vapor
import Fluent
import Foundation

struct StudentController : RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let apiRoutes = routes.grouped("api");
        let protectedRoutes = apiRoutes.grouped([StudentUserAuthenticator(), UserToken.guardMiddleware()])

        protectedRoutes.get("logoutall", use: logOutAllDevices);
        
        protectedRoutes.get("events", use: fetchEvents);
    }

    func logOutAllDevices(_ req: Request) async throws -> Msg {
        let userToken = try req.jwt.verify(as: UserToken.self);
        
        guard let studentUser = try await StudentUser.find(userToken.userId, on: req.db) else {
            throw Abort(.notFound);
        }

        studentUser.expiredNum += 1;

        try await studentUser.save(on: req.db);
        return Msg(success: true, msg: "Logged out of all devices!");
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
