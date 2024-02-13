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
        protectedRoutes.post("profile", use: fetchProfile);
        protectedRoutes.post("events", use: fetchEvents);
        protectedRoutes.post("event", ":id", use: fetchEvent);
        protectedRoutes.post("clubs", use: fetchClubs);
        protectedRoutes.post("club", ":id", use: fetchClub);
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
                .first(), try Bcrypt.verify(decodedString, created: user.passwordHash)
        else {
            throw Abort(.unauthorized);
        }

        guard let studentUser = try await StudentUser.query(on: req.db)
                .with(\.$user)
                .filter(\.$user.$id == user.id!)
                .first()
                else {
            throw Abort(.badRequest, reason: "StudentUser doesn't exist?");
        }
        
        let jwtToken = try UserToken(user: studentUser); 
        return Msg(success: true, msg: try req.jwt.sign(jwtToken));
    }

    func logOutAllDevices(_ req: Request) async throws -> Msg {
        let userToken = try req.jwt.verify(as: UserToken.self);
        
        guard let studentUser = try await StudentUser.query(on: req.db)
                .join(User.self, on: \StudentUser.$user.$id == \User.$id)
                .filter(User.self, \.$id == userToken.userId)
                .first()
        else {
            throw Abort(.unauthorized);
        }

        studentUser.expiredNum += 1;

        try await studentUser.save(on: req.db);
        return Msg(success: true, msg: "Logged out of all devices!");
    }

    struct ProfileInfo : Content {
        var name: String;
        var studentID: Int;
        var points: Int;
/*        var rankingNum = Int;
        var rankingPercent = Int;
        var rankingNumGrade = Int;
        var rankingPercentGrade = Int; */
        var grade: Int;
        var house: Int;
    }

    func fetchProfile(_ req: Request) async throws -> ProfileInfo {
        let userToken = try req.jwt.verify(as: UserToken.self);
        
        guard let studentUser = try await StudentUser.query(on: req.db)
                .join(User.self, on: \StudentUser.$user.$id == \User.$id)
                .filter(User.self, \.$id == userToken.userId)
                .first()
        else {
            throw Abort(.unauthorized);
        }

        let both = try studentUser.joined(User.self);
        return ProfileInfo.init(
          name: both.name, studentID: studentUser.studentID, points: studentUser.points,
//          rankingNum: Int(1), rankingPercent: Int(1), rankingNumGrade: Int(1), rankingPercentGrade: 1,
          grade: (studentUser.grade ?? -1), house: (studentUser.house ?? -1)
        )
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

    struct FullEventInfo : Content {
        var id: Int;
        var name: String;
        var description: String;
        var eventType: String;
        var locationName: String;
        var address: String;
        var pointsWorth: Int;
        var startDate: Date;
        var endDate: Date;
    }

    func fetchEvent(_ req: Request) async throws -> FullEventInfo {
        guard let id = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
        
        guard let event = try await Events.query(on: req.db)
          .join(Location.self, on: \Events.$location.$id == \Location.$id)
          .filter(\.$id == id)
          .first()
        else {
            throw Abort(.badRequest);
        }
        
        let both = try event.joined(Location.self);
        return FullEventInfo.init(id: event.id!, name: event.name, description: event.description, eventType: event.eventType, locationName: both.locationName, address: both.address, pointsWorth: event.pointsWorth, startDate: event.startDate, endDate: event.endDate)
    }

    struct ClubInfo : Content {
        var id: Int;
        var name: String;
        var descritpion: String;
        // todo: revisit        var categories: [String];
    }

    func fetchClubs(_ req: Request) async throws -> [ClubInfo] {
        let clubs = try await Club.query(on: req.db)
          .all()
          .map { club in
              ClubInfo.init(id: club.id!, name: club.name, descritpion: club.description)
          };

        return clubs;
    }

    struct FullClubInfo : Content {
        var name: String;
        var description: String;
        var meetingTimes: String?;
        var locationName: String?;
        var websiteLink: String?;
        var instagramLink: String?;
        var twitterLink: String?;
        var youtubeLink: String?;
    }

    func fetchClub(_ req: Request) async throws -> FullClubInfo {
        guard let id = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }

        let club = try await Club.query(on: req.db)
          .filter(\.$id == id)
          .first()
          .map { club in
              FullClubInfo.init(name: club.name, description: club.description, meetingTimes: club.meetingTimes, locationName: club.locationName, websiteLink: club.websiteLink, instagramLink: club.instagramLink, twitterLink: club.twitterLink, youtubeLink: club.youtubeLink)
          };

        guard let clubUnwrapped = club else {
            throw Abort(.badRequest, reason: "Club not found");
        }

        return clubUnwrapped; 
    }
    
}
