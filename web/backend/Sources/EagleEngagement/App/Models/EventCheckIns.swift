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
    @Parent(key: "userID")
    public var user: User

    /// ID of event checked in to
    @Parent(key: "eventID")
    public var event: Events

    /// uuid of device used to check in
    @Field(key: "deviceUUID")
    public var deviceUUID: String

    /// latitude of check in
    @Field(key: "latitude")
    public var latitude: Double
    
    /// longitude of check in
    @Field(key: "longitude")
    public var longitude: Double

    /// date of check in
    @Timestamp(key: "date", on: .create)
    public var date: Date?

    /// type of check in
    @Enum(key: "checkinType")
    public var checkinType: CheckInType

    // Creates a new, empty EventCheckIn.
    public init() { }

    public init(user: User, event: Events, deviceUUID: String, latitude: Double, longitude: Double) {
        self.$user.id = user.id!;
        self.$event.id = event.id!;
        self.deviceUUID = deviceUUID;
        self.latitude = latitude;
        self.longitude = longitude;
        self.checkinType = .location;
    }
}

