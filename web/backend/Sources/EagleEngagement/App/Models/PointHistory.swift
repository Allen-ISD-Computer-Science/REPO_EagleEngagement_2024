import Vapor
import Fluent
import FluentMySQLDriver

/// This class provides the model for a ClubFollowerUser
final public class PointHistory: Model, Content {
    // Name of the table or collection.
    public static let schema = "PointHistories"

    @ID(key: .id)
    public var id: UUID?

    // userID to be associated with the point modification
    @Field(key: "userID")
    public var userID: Int

    // reason for the point modification
    @Field(key: "reason")
    public var clubID: String

    // Amount of points added or removed
    @Field(key: "points")
    public var points: Int

    @Timestamp(key: "date", on: .create)
    var followedAt: Date?
    
    // Creates a new, empty PointHistory
    public init() { }
}
