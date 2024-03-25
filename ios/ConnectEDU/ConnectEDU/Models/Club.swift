//
//  Club.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import Foundation

struct Club: Codable {
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

//POST /api/club/:id
//
//Returns { name: String, description: String, sponsors: String, meetingTimes: String?, locationName: String?, websiteLink: String?, instagramLink: String?, twitterLink: String?, youtubeLink: String? }
