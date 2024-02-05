import Vapor
import Fluent
import FluentMySQLDriver

/// This class provides the model for an Employee
final public class Location: Model, Content {
    // Name of the table or collection.
    public static let schema = "Locations"

    /// Unique identifier for this Event.
    @ID(custom: "id", generatedBy: .database)
    public var id: Int?

    /// Name of location
    @Field(key: "name")
    public var locationName: String

    /// Address of location
    @Field(key: "address")
    public var address: String

    /// latitude of location
    @Field(key: "latitude")
    public var latitude: Float

    /// longitude of location
    @Field(key: "longitude")
    public var longitude: Float

    /// radius in meters
    @Field(key: "radius")
    public var radius: Float

    // Creates a new, empty Location.
    public init() { }
}

