import Vapor
import Fluent
import Crypto

struct SignUpParams : Content {
    var firstName : String;
    var lastName : String;
    var email : String;
    var studentID : Int;
}

struct StudentSignUp {
    func randomString(length: Int) -> String {
        let letters = "abcdefgh0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func signUp(req: Request) async throws -> Msg {
        let args = try req.content.decode(SignUpParams.self);

        if (args.firstName.isEmpty || args.lastName.isEmpty || args.email.isEmpty || args.studentID <= 0) {
            throw Abort(.badRequest);
        }

        if (!args.email.hasSuffix("@student.allenisd.org") || Array(args.email.split(separator: "@")).count > 2) {
            throw Abort(.badRequest, reason: "Email not permitted for Student SignUp.");
        }

        let existingUser = try await User.query(on: req.db)
          .filter(\.$email == args.email)
          .first();

        if existingUser != nil {
            throw Abort(.badRequest, reason: "Email is already in use.");
        }
        
        let verificationString = randomString(length: 8);

        let user = User(
          email: args.email,
          name: args.firstName + " " + args.lastName,
          passwordHash: "",
          verificationToken: verificationString,
          type: .unverified
        );

        try await user.save(on: req.db);

        let studentUser = StudentUser(
          userID: user.id!,
          studentID: args.studentID
        );

        try await studentUser.save(on: req.db);

        print("Created: \(args.email) with verificationToken: \(verificationString)");

        return Msg(success: true, msg: "Created User! Check email for verification code!");
    }
    
}
