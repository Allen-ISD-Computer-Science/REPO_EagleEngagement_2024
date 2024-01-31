import Fluent
import Vapor
import JWT

struct UserToken: Content, Authenticatable, JWTPayload {

    // Expiration - 8 Months;
    let expirationTime: TimeInterval = 60 * 60 * 24 * 31 * 8;

    // Token Data
    var expiration: ExpirationClaim
    var userId: Int
    var expiredNum: Int // Allows users to "Log out on all devices"

    init(userId: Int, expiredNum: Int) {
        self.userId = userId;
        self.expiredNum = expiredNum;
        self.expiration = ExpirationClaim(value: Date().addingTimeInterval(expirationTime))
    }

    init(user: StudentUser) throws {
        self.userId = user.user.id!;
        self.expiredNum = user.expiredNum;
        self.expiration = ExpirationClaim(value: Date().addingTimeInterval(expirationTime))
    }

    func verify(using signer: JWTSigner) throws {
        try expiration.verifyNotExpired()
    }
}

struct StudentUserAuthenticator : JWTAuthenticator {

    func authenticate(jwt: UserToken, for req: Request) -> EventLoopFuture<Void> {
        StudentUser.query(on: req.db)
          .join(User.self, on: \StudentUser.$user.$id == \User.$id)
          .filter(User.self, \.$id == jwt.userId)
          .first()
          .map {
              do {
                  if let user = $0, user.expiredNum == jwt.expiredNum {
                      req.auth.login(jwt);
                  }
              } catch { }
          }

        return req.eventLoop.makeSucceededFuture(());
    }
    
}
