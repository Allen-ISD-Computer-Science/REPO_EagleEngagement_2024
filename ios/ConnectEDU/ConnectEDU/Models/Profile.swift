//
//  Profile.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-07.
//

import Foundation

struct Profile: Codable {
    let name: String
    let studentID: Int
    let points: Int
    let grade: Int
    let house: Int
}
