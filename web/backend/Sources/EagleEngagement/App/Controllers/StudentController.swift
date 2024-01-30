import Vapor
import Fluent
import Foundation

struct StudentLoginParams : Content {
    var email: String;
    var password: String;
}

struct StudentController : RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let apiRoutes = routes.grouped("api");
        let protectedRoutes = apiRoutes.grouped([UserToken.authenticator(), StudentUserAuthenticator(), UserToken.guardMiddleware()])

        let studentSignUp = StudentSignUp();
        let verification = Verification();

        // Auth
        apiRoutes.post("signup", use: studentSignUp.signUp);
        apiRoutes.post("verify", use: verification.verifyUser);
        apiRoutes.post("login", use: login);
        protectedRoutes.post("logOutAll", use: logOutAllDevices);
        
        // Data
        protectedRoutes.post("events", use: fetchEvents);
    }

    func login(_ req: Request) async throws -> Msg {
        let args = try req.content.decode(StudentLoginParams.self);

        if (args.email.isEmpty || args.password.isEmpty) {
            throw Abort(.badRequest);
        }

        if (!args.email.hasSuffix("@student.allenisd.org") || Array(args.email.split(separator: "@")).count > 2) {
            throw Abort(.badRequest, reason: "Email not permitted for Student Login.");
        }

        var decodedString = ""
        if let decodedData = Data(base64Encoded: args.password) {
            decodedString = String(data: decodedData, encoding: .utf8)!
        }

        guard let user = try await User.query(on: req.db)
                .filter(\.$email == args.email)
                .first(), try Bcrypt.verify(args.password, created: user.passwordHash)
        else {
            throw Abort(.unauthorized);
        }

        guard let studentUser = try await StudentUser.find(user.id!, on: req.db) else {
            throw Abort(.badRequest, reason: "StudentUser doesn't exist?");
        }
        
        let jwtToken = try UserToken(user: studentUser); 
        return Msg(success: true, msg: try req.jwt.sign(jwtToken));
    }

    func logOutAllDevices(_ req: Request) async throws -> Msg {
        let userToken = try req.jwt.verify(as: UserToken.self);
        
        guard let studentUser = try await StudentUser.find(userToken.userId, on: req.db) else {
            throw Abort(.unauthorized);
        }

        studentUser.expiredNum += 1;

        try await studentUser.save(on: req.db);
        return Msg(success: true, msg: "Logged out of all devices!");
    }

    struct EventInfo : Content {
        var id: Int;
        var name: String;
        var eventType: String;
        var locationName: String;
        var pointsWorth: Int;
        var startDate: Date;
        var endDate: Date;
    }
    
    func fetchEvents(_ req: Request) async throws -> [EventInfo] {
        let currentDate = Date()
        
        let events = try await Events.query(on: req.db)
          .join(Location.self, on: \Events.$location.$id == \Location.$id)
          .filter(Events.self, \.$endDate >= currentDate)
          .sort(Events.self, \.$startDate)
          .field(Events.self, \.$id)
          .field(Events.self, \.$name)
          .field(Events.self, \.$eventType)
          .field(Location.self, \.$locationName)
          .field(Events.self, \.$pointsWorth)
          .field(Events.self, \.$startDate)
          .field(Events.self, \.$endDate)
          .all()
          .map { ev in
              let both = try ev.joined(Location.self);
              return EventInfo.init(id: ev.id!, name: ev.name, eventType: ev.eventType, locationName: both.locationName, pointsWorth: ev.pointsWorth, startDate: ev.startDate, endDate: ev.endDate)
          };

        return events;
    }

    
}
