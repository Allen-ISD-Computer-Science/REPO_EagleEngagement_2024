import Vapor
import Fluent
import FluentMySQLDriver

/// This class provides the model for a ClubFollowerUser
final public class ClubAttendance: Model, Content {
    // Name of the table or collection.
    public static let schema = "ClubAttendance"

    @ID(key: .id)
    public var id: UUID?

    // userID to be associated with a club checkin
    @Field(key: "userID")
    public var userID: Int

    // clubID that links to the club the user checked into
    @Field(key: "clubID")
    public var clubID: Int

    // The UUID of the device used to make the request
    @Field(key: "deviceUUID")
    public var deviceUUID: String

    // Latitude of the device that made the checkin
    @Field(key: "latitude")
    public var latitude: Float

    // Longitude of the device that made the checkin
    @Field(key: "longitude")
    public var longitude: Float

    @Timestamp(key: "date", on: .create)
    public var checkedInAt: Date?

    // Creates a new, empty ClubAttendance
    public init() { }
}
