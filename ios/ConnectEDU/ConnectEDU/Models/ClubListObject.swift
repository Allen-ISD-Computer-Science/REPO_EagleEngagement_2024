//
//  ClubListObject.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-19.
//

import Foundation

struct ClubListObject: Codable, Identifiable, Equatable {
    var id: Int
    var name: String
    var description: String
}
