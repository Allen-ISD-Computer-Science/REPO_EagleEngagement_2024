//
//  Event-Full.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-08.
//

import Foundation

struct EventFull: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let eventType: String
    let description: String
    let locationName: String
    let address: String
    let pointsWorth: Int
    let startDate: Date
    let endDate: Date
}

//POST /api/event/:id
//
//Returns: {id: INT, name: String, eventType: String, descrition: String, locationName: String, address: String, pointsWorth: INT, startDate: Date, endDate: Date}
