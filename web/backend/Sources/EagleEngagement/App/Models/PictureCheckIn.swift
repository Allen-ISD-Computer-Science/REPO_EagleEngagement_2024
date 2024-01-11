import Vapor
import Fluent
import FluentMySQLDriver

/// This class provides the model for a PointCheckIn
final public class PictureCheckIn: Model, Content {
    // Name of the table or collection.
    public static let schema = "PicuteCheckIns"

    /// Unique identifier for this CheckIn
    @ID(custom: "checkinID")
    public var id: Int?

    // status based on admin
    @Enum(key: "status")
    public var status: StatusType

    // imagePath to the file the user uploaded (optional)
    @Field(key: "imagePath")
    public var imagePath: String?
    
    // Creates a new, empty PictureCheckIn
    public init() { }
}
