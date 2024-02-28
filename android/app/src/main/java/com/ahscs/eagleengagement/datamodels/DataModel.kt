package com.ahscs.eagleengagement.datamodels

import java.util.Date

sealed class DataModel {
    data class ProfileResponse(
        var name: String,
        var studentID: Int,
        var points: Int,
        var grade: Int,
        var house: Int
    ) : DataModel()

    data class EventResponse(
        var id: Int,
        var name: String,
        var eventType: String,
        var locationName: String,
        var pointsWorth: Int,
        var startDate: Date,
        var endDate: Date
    ) : DataModel()

    data class EventContentResponse(
        var id: Int,
        var name: String,
        var description: String,
        var eventType: String,
        var locationName: String,
        var address: String,
        var pointsWorth: Int,
        var startDate: Date,
        var endDate: Date
    ) : DataModel()

    data class ClubResponse(
        var id: Int,
        var name: String,
        var description: String
    ) : DataModel()

    data class ClubContentResponse(
        var name: String,
        var description: String,
        var meetingTimes: String?,
        var locationName: String?,
        var websiteLink: String?,
        var instagramLink: String?,
        var twitterLink: String?,
        var youtubeLink: String?
    ) : DataModel()
}