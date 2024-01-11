import Vapor
import Fluent
import FluentMySQLDriver

/// This class provides the model for a ClubSponsorUser
final public class ClubSponsorUser: Model, Content {
    // Name of the table or collection.
    public static let schema = "ClubSponsorUsers"

    @ID(key: .id)
    public var id: UUID?
    
    // Email associated with the User account
    @Field(key: "userID")
    public var userID: Int

    // Name of the User
    @Field(key: "clubID")
    public var clubID: Int

    // Creates a new, empty ClubSponsorUser.
    public init() { }
}
