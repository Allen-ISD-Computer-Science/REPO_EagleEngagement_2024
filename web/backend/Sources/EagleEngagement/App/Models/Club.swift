import Vapor
import Fluent
import FluentMySQLDriver

/// This class provides the model for a Club
final public class Club: Model, Content {
    // Name of the table or collection.
    public static let schema = "Clubs"

    /// Unique identifier for this Club
    @ID(custom: "id", generatedBy: .database)
    public var id: Int?

    // The Club's name
    @Field(key: "name")
    public var name: String

    // Description for the club
    @Field(key: "description")
    public var description: String

    // Meeting Times for the club
    @Field(key: "meetingTimes")
    public var meetingTimes: String?

    // Meeting Location Name for the club
    @Field(key: "locationName")
    public var locationName: String?

    // Latitude for the club meeting
    @Field(key: "latitude")
    public var latitude: Float?

    // Latitude for the club meeting
    @Field(key: "longitude")
    public var longitude: Float?

    // Radius in meters for the club meeting
    @Field(key: "radius")
    public var radius: Float?

    // Website for the club
    @Field(key: "websiteLink")
    public var websiteLink: String?
    
    // Instagram for the club
    @Field(key: "instagramLink")
    public var instagramLink: String?

    // Twitter for the club
    @Field(key: "twitterLink")
    public var twitterLink: String?

    // Youtube for the club
    @Field(key: "youtubeLink")
    public var youtubeLink: String?
    
    // Creates a new, empty Club
    public init() { }
}
