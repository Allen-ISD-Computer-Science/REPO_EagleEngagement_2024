package com.ahscs.eagleengagement

import com.ahscs.eagleengagement.datamodels.AuthDataModel
import com.ahscs.eagleengagement.datamodels.AuthDataModel.LoginDataModel
import com.ahscs.eagleengagement.datamodels.DataModel
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.Header
import retrofit2.http.POST

interface RetrofitAPI {
    @POST("login")
    fun postLogin(@Body dataModel: LoginDataModel?) : Call<AuthDataModel.response>

    @POST("profile")
    fun postProfile(@Header("Authorization") authToken: String) : Call<DataModel.ProfileResponse>

    @POST("signup")
    fun postSignUp(@Body dataModel: AuthDataModel.SignUpDataModel?) : Call<AuthDataModel.response>
}