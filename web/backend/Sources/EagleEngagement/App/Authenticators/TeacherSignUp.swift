import Vapor
import Fluent
import Crypto

struct TeacherSignUpParams : Content {
    var firstName : String;
    var lastName : String;
    var email : String;
    var password : String;
    var passwordConfirm: String;
}

struct TeacherSignUp {
    func randomString(length: Int) -> String {
        let letters = "abcdefgh0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }

    func signUp(_ req: Request) async throws -> Msg {
        let args = try req.content.decode(TeacherSignUpParams.self);

        if (args.firstName.isEmpty || args.lastName.isEmpty || args.email.isEmpty || args.password.isEmpty || args.passwordConfirm.isEmpty) {
            throw Abort(.badRequest);
        }

        if (args.password != args.passwordConfirm) {
            throw Abort(.badRequest, reason: "Passwords do not match.");
        }

        if (!args.email.hasSuffix("@allenisd.org") || Array(args.email.split(separator: "@")).count > 2) {
            throw Abort(.badRequest, reason: "Email not permitted for Faculty SignUp.");
        }

        let existingUser = try await User.query(on: req.db)
          .filter(\.$email == args.email)
          .first();

        if existingUser != nil {
            throw Abort(.badRequest, reason: "Email is already in use.");
        }

        var decodedString = ""
        if let decodedData = Data(base64Encoded: args.password) {
            decodedString = String(data: decodedData, encoding: .utf8)!
        }

        let passwordHash = try Bcrypt.hash(decodedString);
        let verificationString = randomString(length: 8);
        
        let user = User(
          email: args.email,
          name: args.firstName + " " + args.lastName,
          passwordHash: passwordHash,
          verificationToken: verificationString,
          type: .unverified
        );

        try await user.save(on: req.db);

        print("Created: \(args.email) with verificationToken: \(verificationString)");
        
        return Msg(success: true, msg: "Created User! Check email for verification code!");

    }
    
}
