//
//  Endpoints.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import Foundation

struct Endpoints {
    static let baseAPIURL = "https://stg.codermerlin.academy/vapor/logan-rohlfs/api"

    static let signUp = "\(baseAPIURL)/signup"
    static let verify = "\(baseAPIURL)/verify"
    static let login = "\(baseAPIURL)/login"
    static let logOutAll = "\(baseAPIURL)/logOutAll"
    
    static let events = "\(baseAPIURL)/events"
    // Other endpoints...
}
