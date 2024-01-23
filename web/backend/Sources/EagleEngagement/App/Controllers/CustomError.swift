import Vapor

struct CustomError: Content {
    let didError: Bool = true;
    let error: String;
}
