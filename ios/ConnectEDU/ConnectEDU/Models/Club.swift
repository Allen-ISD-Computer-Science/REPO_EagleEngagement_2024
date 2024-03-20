//
//  Club.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import Foundation

struct Club: Codable {
    var id: Int
    var name: String
    var description: String
    var sponsors: String?
    var meetingTimes: String?
    var locationName: String?
    var websiteLink: String?
    var instagramLink: String?
    var twitterLink: String?
    var youtubeLink: String?
}
