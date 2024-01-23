import Vapor
import Fluent
import Crypto

struct SignUpParams : Content {
    var firstName : String;
    var lastName : String;
    var email : String;
    var password : String;
    var confirmPassword: String;
    var studentID : Int;
}

struct StudentSignUp {
    
    func signUp(req: Request) async throws -> any Content {
        let args = try req.query.decode(SignUpParams.self);

        if args.password != args.confirmPassword {
            return CustomError(error: "Passwords do not match.");
        }

        let existingUser = try await User.query(on: req.db)
          .filter(\.$email == args.email)
          .first();

        if existingUser != nil {
            return CustomError(error: "Email is already in use.");
        }

        let passwordHash = try Bcrypt.hash(args.password);

        let user = User(
          email: args.email,
          name: args.firstName + " " + args.lastName,
          passwordHash: passwordHash,
          type: .unverified
        );

        try await user.save(on: req.db);

        let studentUser = StudentUser(
          userID: user.id!,
          studentID: args.studentID
        );

        try await studentUser.save(on: req.db);

        return Msg(success: true, msg: "Created User!");
    }
    
}
