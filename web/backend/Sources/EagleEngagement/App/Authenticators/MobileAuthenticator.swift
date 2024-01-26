import Vapor
import JWT

// Example JWT payload.
struct SessionToken: Content, Authenticatable, JWTPayload {

    // Expiration - 6 Months;
    let expirationTime: TimeInterval = 60 * 60 * 24 * 31 * 6;

    // Token Data
    var expiration: ExpirationClaim
    var userId: Int
    var expiredNum: Int // Allows users to "Log out on all devices"

    init(userId: Int, expiredNum: Int) {
        self.userId = userId;
        self.expiredNum = expiredNum;
        self.expiration = ExpirationClaim(value: Date().addingTimeInterval(expirationTime))
    }    

    init(user: User) throws {
        self.userId = user.id!;
        self.expiredNum = 1;
        self.expiration = ExpirationClaim(value: Date().addingTimeInterval(expirationTime))
    }

    func verify(using signer: JWTSigner) throws {
        try expiration.verifyNotExpired()
    }
}
