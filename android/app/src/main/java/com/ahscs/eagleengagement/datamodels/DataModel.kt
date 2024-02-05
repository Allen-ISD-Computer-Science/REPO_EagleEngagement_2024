package com.ahscs.eagleengagement.datamodels

sealed class DataModel {
    data class ProfileResponse(
        var name: String,
        var studentID: Int,
        var points: Int,
        var grade: Int,
        var house: Int
    ) : DataModel()
}