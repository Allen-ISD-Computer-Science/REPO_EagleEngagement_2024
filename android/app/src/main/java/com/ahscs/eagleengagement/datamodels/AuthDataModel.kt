package com.ahscs.eagleengagement.datamodels

sealed class AuthDataModel {
    data class LoginDataModel(
        var email: String,
        var password: String
    ) : AuthDataModel()

    data class SignUpDataModel(
        var firstName: String,
        var lastName: String,
        var email: String,
        var studentID: Int
    ) : AuthDataModel()

    data class response(
        var success: Boolean,
        var msg: String
    ) : AuthDataModel()
}