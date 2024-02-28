package com.ahscs.eagleengagement

import com.ahscs.eagleengagement.datamodels.AuthDataModel
import com.ahscs.eagleengagement.datamodels.AuthDataModel.LoginDataModel
import com.ahscs.eagleengagement.datamodels.DataModel
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.Header
import retrofit2.http.POST
import retrofit2.http.Path

interface RetrofitAPI {
    @POST("login")
    fun postLogin(@Body dataModel: LoginDataModel?) : Call<AuthDataModel.response>

    @POST("profile")
    fun postProfile(@Header("Authorization") authToken: String) : Call<DataModel.ProfileResponse>

    @POST("signup")
    fun postSignUp(@Body dataModel: AuthDataModel.SignUpDataModel?) : Call<AuthDataModel.response>

    @POST("verify")
    fun postVerify(@Body dataModel: AuthDataModel.VerifyDataModel?) : Call<AuthDataModel.response>

    @POST("events")
    fun postEvents(@Header("Authorization") authToken: String): Call<MutableList<DataModel.EventResponse>>

    @POST("event/{id}")
    fun postEventContent(@Header ("Authorization") authToken: String, @Path("id") eventId: String): Call<DataModel.EventContentResponse>

    @POST("clubs")
    fun postClubs(@Header("Authorization") authToken: String): Call<MutableList<DataModel.ClubResponse>>

    @POST("club/{id}")
    fun postClubContent(@Header ("Authorization") authToken: String, @Path("id") clubId: String): Call<DataModel.ClubContentResponse>
}