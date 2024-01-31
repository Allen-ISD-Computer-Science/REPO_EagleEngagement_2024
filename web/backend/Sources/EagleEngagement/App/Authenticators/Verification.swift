import Vapor
import Fluent
import Crypto

struct VerifyParams : Content {
    var email: String;
    var token: String;
    var password: String;
    var passwordConfirm: String;
}

struct Verification {

    func verifyUser(req: Request) async throws -> Msg {
        let args = try req.content.decode(VerifyParams.self);

        if (args.email.isEmpty || args.token.isEmpty) {
            throw Abort(.badRequest);
        }

        if (!args.email.hasSuffix("allenisd.org") || Array(args.email.split(separator: "@")).count > 2) {
            throw Abort(.badRequest, reason: "Email not permitted for verification.");
        }

        if (args.password != args.passwordConfirm) {
            throw Abort(.badRequest, reason: "Passwords do not match.");
        }

        let userOpt = try await User.query(on: req.db)
          .filter(\.$email == args.email)
          .first();

        if (userOpt == nil || userOpt!.verificationToken != args.token) {
            throw Abort(.badRequest, reason: "Account not found or invalid token.");
        }

        let user = userOpt!;

        var decodedString = ""
        if let decodedData = Data(base64Encoded: args.password) {
            decodedString = String(data: decodedData, encoding: .utf8)!
        }

        user.verificationToken = "";
        user.passwordHash = try Bcrypt.hash(decodedString);

        if (args.email.contains("@student.allenisd.org")) {
            user.userType = .student;
        } else {
            user.userType = .teacher;
        }

        try await user.save(on: req.db);

        if (args.email.contains("@student.allenisd.org")) {
            let studentUser = try await StudentUser.query(on: req.db)
              .with(\.$user)
              .filter(\.$user.$id == user.id!)
              .first();
            if (studentUser == nil) {
                throw Abort(.badRequest, reason: "StudentUser doesn't exist?");
            }
            
            let jwtToken = try UserToken(user: studentUser!); 
            return Msg(success: true, msg: try req.jwt.sign(jwtToken));
        }

        return Msg(success: true, msg: "Created User! Check email for verification code!");
    }
    
}
