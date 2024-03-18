//
//  Event.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import Foundation

struct Event: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let eventType: String
    let locationName: String
    let pointsWorth: Int
    let startDate: Date
    let endDate: Date
}
