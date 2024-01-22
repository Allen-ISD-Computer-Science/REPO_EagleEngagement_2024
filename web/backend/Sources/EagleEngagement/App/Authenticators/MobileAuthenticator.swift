import Vapor
/* Commenting so can build
 import JWT

// Example JWT payload.
struct SessionToken: Content, Authenticatable, JWTPayload {

    // Expiration - 6 Months;
    let expirationTime: TimeInterval = 60 * 60 * 24 * 31 * 6;

    // Token Data
    var expiration: ExpirationClaim
    var userId: Int
    var expiredNum: Int // Allows users to "Log out on all devices"

    init(userId: Int) {
        guard let user = User.query(app.db).filter(\.$id == userId).first() else {
            throw Abort();
        }
        
        self.userId = user.id;
        self.expiredNum = user.expiredNum;
        self.expiration = ExpirationClaim(value: Date().addingTimeInterval(expirationTime))}
        

    init(user: User) throws {
        self.userId = user.id;
        self.expiration = ExpirationClaim(value: Date().addingTimeInterval(expirationTime))
    }

    func verify(using signer: JWTSigner) throws {
        try expiration.verifyNotExpired()
    }
}
*/
