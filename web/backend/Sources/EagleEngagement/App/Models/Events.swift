import Vapor
import Fluent
import FluentMySQLDriver

/// This class provides the model for an Employee
final public class Events: Model, Content {
    // Name of the table or collection.
    public static let schema = "Events"

    /// Unique identifier for this Event.
    @ID(custom: "id", generatedBy: .database)
    public var id: Int?

    /// Name of event
    @Field(key: "name")
    public var name: String

    // Description of event
    @Field(key: "description")
    public var description: String

    /// Location id
    @Parent(key: "locationID")
    public var location: Location

    /// point value
    @Field(key: "pointsWorth")
    public var pointsWorth: Int

    /// event type (Football, Band Concert, etc)
    @Field(key: "eventType")
    public var eventType: String

    // Date the event will be held
    @Field(key: "startDate")
    public var startDate: Date

    // Date event ends (has to be same day)
    @Field(key: "endDate")
    public var endDate: Date

    // if there is a custom image
    @Field(key: "customImage")
    public var customImagePath: String

    // Creates a new Event
    public init(name: String, description: String, eventType: String, locationID: Int, pointsWorth: Int, startDate: Date, endDate: Date, customImagePath: String) {
        self.name = name;
        self.description = description;
        self.eventType = eventType;
        self.location.id = locationID;
        self.pointsWorth = pointsWorth;
        self.startDate = startDate;
        self.endDate = endDate;
        self.customImagePath = customImagePath;
    }
    
    // Creates a new, empty Event.
    public init() { }
}

