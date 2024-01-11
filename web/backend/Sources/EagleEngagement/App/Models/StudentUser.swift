import Vapor
import Fluent
import FluentMySQLDriver

/// This class provides the model for an Employee
final public class StudentUser: Model, Content {
    // Name of the table or collection.
    public static let schema = "StudentUsers"

    /// Unique identifier for this User
    @ID(custom: "userID")
    public var id: Int?

    // Student ID associated with the StudentUser account
    @Field(key: "studentID")
    public var studentID: Int

    // Number of points the studentUser has
    @Field(key: "points")
    public var points: Int

    // Grade of the studentUser
    @Field(key: "grade")
    public var grade: Int

    // House of the studentUser
    @Field(key: "house")
    public var house: Int
    
    // Creates a new, empty User.
    public init() { }
}
