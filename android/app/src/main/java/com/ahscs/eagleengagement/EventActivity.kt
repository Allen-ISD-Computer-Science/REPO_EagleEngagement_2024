package com.ahscs.eagleengagement

import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import com.ahscs.eagleengagement.datamodels.DataModel
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.text.SimpleDateFormat

class EventActivity : AppCompatActivity() {
    var eventAddress : String? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_event_page)

        configureBtns()

        val eventId = intent.getStringExtra("eventId")
        val jwt = intent.getStringExtra("jwt")
        updateEventInfo(jwt!!, eventId!!)

    }

    private fun updateEventInfo(jwt: String, eventId: String) {
        var url = resources.getString(R.string.api_link)
        val retrofit = Retrofit.Builder()
            .baseUrl(url)
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        val retrofitAPI = retrofit.create(RetrofitAPI::class.java)
        val call: Call<DataModel.EventContentResponse> = retrofitAPI.postEventContent("Bearer $jwt", eventId)
        call!!.enqueue(object: Callback<DataModel.EventContentResponse?> {
            override fun onResponse(
                call: Call<DataModel.EventContentResponse?>?,
                response: Response<DataModel.EventContentResponse?>
            ) {

                if (response.isSuccessful) {
                    try {
                        val data = response.body()!!
                        var name : TextView = findViewById(R.id.txtName)
                        name.text = data.name

                        var points : TextView = findViewById(R.id.txtPoints)
                        points.text = data.pointsWorth.toString()

                        var address : TextView = findViewById(R.id.txtAddress)
                        address.text = data.locationName + "\n" + data.address
                        eventAddress = data.address

                        val dayFormat = SimpleDateFormat("EEEE")
                        val day : TextView = findViewById(R.id.txtDay)
                        day.text = dayFormat.format(data.startDate)

                        val timeFormat1 = SimpleDateFormat("h:mma - ")
                        val timeFormat2 = SimpleDateFormat("h:mma")
                        val timeString = timeFormat1.format(data.startDate) + timeFormat2.format(data.endDate)
                        var time : TextView = findViewById(R.id.txtTime)
                        time.text = timeString

                        val dateFormat = SimpleDateFormat("d")
                        var date : TextView = findViewById(R.id.txtDate)
                        date.text = dateFormat.format(data.startDate)

                        val monthFormat = SimpleDateFormat("MMM")
                        val month : TextView = findViewById(R.id.txtMonth)
                        month.text = monthFormat.format(data.startDate)

                        var description : TextView = findViewById(R.id.txtDescription)
                        description.text = data.description
                    } catch (e : Exception) {
                        println("Error getting events")
                    }


                }else{
                    println(response.raw().toString())
                }
            }

            override fun onFailure(call: Call<DataModel.EventContentResponse?>?, t: Throwable) {
                println("Error doing API : " + t.message)
            }
        })
    }

    private fun configureBtns() {
        val backBtn = findViewById<ImageView>(R.id.eventBackBtn)
        backBtn.setOnClickListener {
            finish()
        }

        val directionsBtn = findViewById<ImageView>(R.id.btnDirections)
        directionsBtn.setOnClickListener {
            val map = "https://maps.google.com/maps?q=$eventAddress"
            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(map))
            intent.setClassName("com.google.android.apps.maps", "com.google.android.maps.MapsActivity")
            startActivity(intent)
        }
    }
}