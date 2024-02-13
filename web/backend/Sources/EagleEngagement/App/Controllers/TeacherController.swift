import Vapor
import Fluent
import Foundation

struct TeacherController : RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let teacherRoutes = routes.grouped("faculty");
        let sessionRoutes = teacherRoutes.grouped([User.sessionAuthenticator(), UserAuthenticator()])
        let teacherProtectedRoutes = sessionRoutes.grouped(TeacherMiddleware());

        let apiRoutes = teacherProtectedRoutes.grouped("api"); // /faculty/api
        apiRoutes.post("clubs", use: fetchClubs);
        apiRoutes.post("club", ":id", use: fetchClub);
    }

    struct ClubInfo : Content {
        var id: Int;
        var name: String;
        var descritpion: String;
        var studentsFollowing: Int;
        var lastCheckInCount: Int;
        // todo: revisit        var categories: [String];
    }

    func fetchClubs(_ req: Request) async throws -> [ClubInfo] {
        guard let user = req.auth.get(User.self) else {
            throw Abort(.unauthorized);
        }
          
        let clubs = try await ClubSponsorUser.query(on: req.db)
          .with(\.$user)
          .with(\.$club)
          .filter(\.$user.$id == user.id!)
          .all()
          .map { clubSponsor in
              ClubInfo.init(id: clubSponsor.club.id!, name: clubSponsor.club.name, descritpion: clubSponsor.club.description, studentsFollowing: 100, lastCheckInCount: 30)
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
