import Vapor
import Fluent
import FluentMySQLDriver

/// This class provides the model for a ClubFollowerUser
final public class ClubFollowerUser: Model, Content {
    // Name of the table or collection.
    public static let schema = "ClubFollowerUsers"

    @ID(key: .id)
    public var id: UUID?

    // userID to be associated with a club
    @Field(key: "userID")
    public var userID: Int

    // clubID that links to the club the user followed
    @Field(key: "clubID")
    public var clubID: Int

    @Timestamp(key: "date", on: .create)
    var followedAt: Date?

    // Creates a new, empty ClubSponsorUser.
    public init() { }
}
