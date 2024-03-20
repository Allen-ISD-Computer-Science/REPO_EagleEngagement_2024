import Vapor
import Fluent
import Foundation
import FluentMySQLDriver

struct GradeFlags {
    static var freshman = 0b0001;
    static var sophomore = 0b0010;
    static var junior = 0b0100;
    static var senior = 0b1000;

    // allGrades = freshman | sophomore | junior | senior which should be 0b1111 or 15
}

/// This class provides the model for a PointRequest
final public class Reward: Model, Content {
    // Name of the table or collection.
    public static let schema = "Rewards"

    /// Unique identifier for this Event.
    @ID(custom: "id", generatedBy: .database)
    public var id: Int?

    // Name of the reward
    @Field(key: "name")
    public var name: String
    
    // Description of the reward
    @Field(key: "description")
    public var description: String

    // price of purchasing this reward
    @Field(key: "pointsCost")
    public var cost: Int

    // allowedGrades capable of purchasing this reward - encoded using bitwise operation
    @Field(key: "gradeRestriction")
    public var allowedGrades: Int;
    
    // Creates a new, empty PointRequest.
    public init() { }

    public init(name: String, description: String, cost: Int, allowedGrades: Int) {
        self.name = name;
        self.description = description;
        self.cost = cost;
        self.allowedGrades = allowedGrades;
    }
}
