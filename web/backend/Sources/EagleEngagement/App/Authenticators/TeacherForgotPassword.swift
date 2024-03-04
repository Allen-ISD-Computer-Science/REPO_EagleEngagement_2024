import Vapor
import Fluent
import Foundation

struct TeacherForgotPassword {
    func randomString(length: Int) -> String {
        let letters = "0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }

    struct ForgotQuery : Content {
        var email: String;
    }

    func forgotPassword(_ req: Request) async throws -> Msg {
        let args = try req.content.decode(ForgotQuery.self);

        if (args.email.isEmpty) {
            throw Abort(.badRequest);
        }

        if (!args.email.hasSuffix("@allenisd.org") || Array(args.email.split(separator: "@")).count > 2) {
            throw Abort(.badRequest, reason: "Email invalid.");
        }

        guard let user = try await User.query(on: req.db)
                .filter(\.$email == args.email)
                .first(), user.userType != .student else {
            throw Abort(.badRequest, reason: "Account not found or invalid.");
        }

        let verificationString = randomString(length: 8);
        
        user.verificationToken = verificationString;
        try await user.save(on: req.db);

        guard let facultyForgotTemplateID = Environment.get("FACULTY_FORGOT_TEMPLATE_ID") else {
            fatalError("Failed to determine FACULTY_FORGOT_TEMPLATE_ID from environment");
        }

        let name = user.name.split(separator: " ", maxSplits: 1).map(String.init);
        let firstName = name[0];
        let lastName = name[1];

        let contact = EmailContact(firstName: firstName, lastName: lastName, emailAddress: user.email)
        let verifyEmail = TokenURLEmail(token: verificationString).createContent(with: contact)
        let emailData = EmailData(contact: contact,
                                  templateExternalID: facultyForgotTemplateID,
                                  templateParameters: verifyEmail);

        try await GlobalEmailAPI.sendEmail(from: req, with: emailData)

        return Msg(success: true, msg: "Send forgot code to your email!");
    }

    struct TokenURLEmail: EmailContactConsumer {
        private struct TokenURLEmailWrapper: Encodable {
            let firstName: String?
            let lastName: String?
            let verificationCode: String
            let name: String
            let PUBLIC_URL: String
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
                                        verificationCode: self.token,
                                        name: "\(contact.firstName!) \(contact.lastName!)",
                                        PUBLIC_URL: self.PUBLIC_URL
            )
        }
    }

}
