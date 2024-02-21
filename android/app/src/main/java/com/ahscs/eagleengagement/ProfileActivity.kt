package com.ahscs.eagleengagement

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import com.ahscs.eagleengagement.datamodels.DataModel
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

class ProfileActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_profile_page)
        configureBtns()

        val jwt = intent.getStringExtra("jwt")
        updateProfile(jwt!!)
    }

    fun updateProfile(jwt: String) {
        var url = resources.getString(R.string.api_link)
        val retrofit = Retrofit.Builder()
            .baseUrl(url)
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        val retrofitAPI = retrofit.create(RetrofitAPI::class.java)
        val call: Call<DataModel.ProfileResponse> = retrofitAPI.postProfile("Bearer $jwt")
        call!!.enqueue(object: Callback<DataModel.ProfileResponse?> {
            override fun onResponse(
                call: Call<DataModel.ProfileResponse?>?,
                response: Response<DataModel.ProfileResponse?>
            ) {

                if (response.isSuccessful) {
                    try {
                        val data = response.body()!!
                        val points : TextView = findViewById(R.id.txtInfoPoints)
                        points.text = data.points.toString()

                        val studentId : TextView = findViewById(R.id.txtInfoStudentId)
                        studentId.text = data.studentID.toString()

                        val grade : TextView = findViewById(R.id.txtInfoGrade)
                        if (data.grade == 9) {
                            grade.text = "Freshman"
                        } else if (data.grade == 10) {
                            grade.text = "Sophomore"
                        } else if (data.grade == 11) {
                            grade.text = "Junior"
                        } else if (data.grade == 12) {
                            grade.text = "Senior"
                        } else if (data.grade == -1) {
                            grade.text = "N/A"
                        } else {
                            grade.text = data.grade.toString()
                        }

                        val house : TextView = findViewById(R.id.txtInfoHouse)
                        if (data.house == -1) {
                            house.text = "N/A"
                        } else {
                            house.text = data.house.toString()
                        }
                    } catch (e : Exception) {
                        println("Error getting events")
                    }


                }else{
                    println(response.raw().toString())
                }
            }

            override fun onFailure(call: Call<DataModel.ProfileResponse?>?, t: Throwable) {
                println("Error doing API : " + t.message)
            }
        })
    }

    private fun configureBtns() {
        val backBtn = findViewById<ImageView>(R.id.profileBackBtn)
        backBtn.setOnClickListener {
            finish()
        }

        val pointHistoryBtn = findViewById<ImageView>(R.id.profilePointHistoryBtn)
        pointHistoryBtn.setOnClickListener {
            startActivity(Intent(this, PointHistoryActivity::class.java))
        }
    }
}