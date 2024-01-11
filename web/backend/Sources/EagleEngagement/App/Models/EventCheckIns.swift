import Vapor
import Fluent
import FluentMySQLDriver

public enum CheckInType: String, Codable {
    case location,
         photo,
         manual
}

/// This class provides the model for an Employee
final public class EventCheckIns: Model, Content {
    // Name of the table or collection.
    public static let schema = "EventCheckIns"

    /// Unique identifier for this Event.
    @ID(custom: "id", generatedBy: .database)
    public var id: Int?

    /// ID of user that checked in
    @Field(key: "userID")
    public var userID: Int

    /// ID of event checked in to
    @Field(key: "eventID")
    public var eventID: Int

    /// uuid of device used to check in
    @Field(key: "deviceUUID")
    public var deviceUUID: String

    /// latitude of check in
    @Field(key: "latitude")
    public var latitude: Float
    
    /// longitude of check in
    @Field(key: "longitude")
    public var longitude: Float

    /// date of check in
    @Timestamp(key: "date", on: .create)
    public var date: Date?

    /// type of check in
    @Enum(key: "checkinType")
    public var checkinType: CheckInType

    // Creates a new, empty EventCheckIn.
    public init() { }
}

