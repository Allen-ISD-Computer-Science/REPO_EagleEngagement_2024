import Vapor
import Fluent
import Crypto

extension User : Authenticatable {}

extension User : SessionAuthenticatable {
    public var sessionID: Int
    {
        self.id!
    }
}

struct UserAuthenticator : BasicAuthenticator {

    func authenticate(basic: BasicAuthorization, for req: Request) -> EventLoopFuture<Void> {
        User.query(on: req.db)
          .filter(\.$email == basic.username)
          .first()
          .map {
              do {
                  if let user = $0, try Bcrypt.verify(basic.password, created: user.passwordHash) {
                      req.auth.login(user)
                  }
              }
              catch {
              }
          }
    }
    
}

