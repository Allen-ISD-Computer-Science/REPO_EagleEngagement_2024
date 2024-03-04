package com.ahscs.eagleengagement

import android.content.Intent
import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.ImageView
import android.widget.Spinner
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

        val gradeSpinner : Spinner = findViewById(R.id.gradeSpinner)
        val gradeAdapter = ArrayAdapter.createFromResource(this, R.array.grades, androidx.appcompat.R.layout.support_simple_spinner_dropdown_item)
        gradeSpinner.adapter = gradeAdapter
        gradeSpinner.isClickable = false
        gradeSpinner.isEnabled = false
        gradeSpinner.onItemSelectedListener = (object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(p0: AdapterView<*>?, p1: View?, p2: Int, p3: Long) {
                (gradeSpinner.getChildAt(0) as TextView).setTextColor(Color.WHITE)
                (gradeSpinner.getChildAt(0) as TextView).textSize = 24f
            }

            override fun onNothingSelected(p0: AdapterView<*>?) {
                return
            }
        })
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

                        val gradeSpinner : Spinner = findViewById(R.id.gradeSpinner)
                        if (data.grade == 10) {
                            gradeSpinner.setSelection(2)
                        } else if (data.grade == 11) {
                            gradeSpinner.setSelection(1)
                        } else if (data.grade == 12) {
                            gradeSpinner.setSelection(0)
                        } else if (data.grade == -1) {
//                            grade.text = "N/A"
                        } else {
//                            grade.text = data.grade.toString()
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