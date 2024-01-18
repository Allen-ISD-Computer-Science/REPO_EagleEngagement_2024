import Vapor
import Fluent
import FluentMySQLDriver

public enum UserType: String, Codable {
    case unverified,
         student,
         teacher,
         admin
}

/// This class provides the model for a User
final public class User: Model, Content {
    // Name of the table or collection.
    public static let schema = "Users"

    /// Unique identifier for this User
    @ID(custom: "id", generatedBy: .database)
    public var id: Int?

    // Email associated with the User account
    @Field(key: "email")
    public var email: String

    // Name of the User
    @Field(key: "name")
    public var name: String

    // Hash of the User's Password
    @Field(key: "passwordHash")
    public var passwordHash: String


    @Enum(key: "type")
    public var userType: UserType

    // Creates a new, empty User.
    public init() { }
}
