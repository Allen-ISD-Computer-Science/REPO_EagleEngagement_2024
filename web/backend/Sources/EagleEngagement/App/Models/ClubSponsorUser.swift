import Vapor
import Fluent
import FluentMySQLDriver

/// This class provides the model for a ClubSponsorUser
final public class ClubSponsorUser: Model, Content {
    // Name of the table or collection.
    public static let schema = "ClubSponsorUsers"

    @ID(key: .id)
    public var id: UUID?
    
    // UserID of the sponsor
    @Parent(key: "userID")
    public var user: User

    // ClubID of the club
    @Parent(key: "clubID")
    public var club: Club

    // Creates a new, empty ClubSponsorUser.
    public init() {}

    public init(user: User, club: Club) {
        self.$user.id = user.id!;
        self.$club.id = club.id!;
    }
}
