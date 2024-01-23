import Vapor

final class Msg : Codable {
    let success: Bool;
    let msg: String;

    init (success: Bool, msg: String) {
        self.success = success;
        self.msg = msg;
    }
}

extension Msg: Content {}
