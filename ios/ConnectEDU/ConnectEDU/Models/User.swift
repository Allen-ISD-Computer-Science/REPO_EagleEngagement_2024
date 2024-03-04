//
//  User.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import Foundation

struct User: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var studentID: Int
    var grade: Int?
    var house: Int?
    var points: Int?
}
