package com.ahscs.eagleengagement.datamodels

sealed class AuthDataModel {
    data class LoginDataModel(
        var email: String,
        var password: String
    ) : AuthDataModel()

    data class SignUpDataModel(
        var email: String,
        var password: String
    ) : AuthDataModel()

    data class response(
        var success: Boolean,
        var msg: String
    ) : AuthDataModel()
}