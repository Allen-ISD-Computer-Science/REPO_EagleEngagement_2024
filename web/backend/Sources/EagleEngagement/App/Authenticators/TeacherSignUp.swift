import Vapor
import Fluent
import Crypto

struct TeacherSignUpParams : Content {
    var firstName : String;
    var lastName : String;
    var email : String;
}

struct TeacherSignUp {
    func randomString(length: Int) -> String {
        let letters = "0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }

    func signUp(_ req: Request) async throws -> Msg {
        let args = try req.content.decode(TeacherSignUpParams.self);

        if (args.firstName.isEmpty || args.lastName.isEmpty || args.email.isEmpty) {
            throw Abort(.badRequest);
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

        let verificationString = randomString(length: 8);
        
        let user = User(
          email: args.email,
          name: args.firstName + " " + args.lastName,
          passwordHash: "",
          verificationToken: verificationString,
          type: .unverified
        );

        try await user.save(on: req.db);

        guard let facultySignUpTemplateID = Environment.get("FACULTY_SIGNUP_TEMPLATE_ID") else {
            fatalError("Failed to determine FACULTY_SIGNUP_TEMPLATE_ID from environment");
        }

        let contact = EmailContact(firstName: args.firstName, lastName: args.lastName, emailAddress: user.email)
        let verifyEmail = TokenURLEmail(token: verificationString).createContent(with: contact)
        let emailData = EmailData(contact: contact,
                                  templateExternalID: facultySignUpTemplateID,
                                  templateParameters: verifyEmail)
        
        try await GlobalEmailAPI.sendEmail(from: req, with: emailData)

        print("Created: \(args.email) with verificationToken: \(verificationString)");
        
        return Msg(success: true, msg: "Created User! Check email for verification code!");
    }

    struct TokenURLEmail: EmailContactConsumer {
        private struct TokenURLEmailWrapper: Encodable {
            let firstName: String?
            let lastName: String?
            let PUBLIC_URL: String
            let verificationCode: String 
        }

        let PUBLIC_URL: String;
        let token: String;

        init(token: String) {
            guard let vaporPublic = Environment.get("VAPOR_SERVER_PUBLIC_URL") else {
                fatalError("Failed to determine VAPOR_SERVER_PUBIC_URL from environment");
            }

            self.PUBLIC_URL = vaporPublic;
            self.token = token;
        }

        func createContent(with contact: EmailContact) -> Encodable {
            return TokenURLEmailWrapper(firstName: contact.firstName,
                                        lastName: contact.lastName,
                                        PUBLIC_URL: self.PUBLIC_URL,
                                        verificationCode: self.token
            )
        }
    }
    
}
