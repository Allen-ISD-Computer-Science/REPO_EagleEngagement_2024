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

    /// Location id
    @Field(key: "locationID")
    public var locationID: Int

    /// point value
    @Field(key: "pointsWorth")
    public var pointsWorth: Int

    /// event type (Football, Band Concert, etc)
    @Field(key: "eventType")
    public var eventType: String

    // Date the event will be held
    @Field(key: "date")
    public var startDate: Date

    // Date event ends (has to be same day)
    @Field(key: "end")
    public var endDate: Date

    // Creates a new, empty Event.
    public init() { }
}

