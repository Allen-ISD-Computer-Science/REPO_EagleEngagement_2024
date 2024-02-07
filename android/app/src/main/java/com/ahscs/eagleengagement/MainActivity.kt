package com.ahscs.eagleengagement

import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.ContactsContract.Data
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import androidx.fragment.app.Fragment
import com.ahscs.eagleengagement.datamodels.AuthDataModel
import com.ahscs.eagleengagement.datamodels.DataModel
import com.google.android.material.bottomnavigation.BottomNavigationView
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.io.File
import java.io.FileOutputStream

class MainActivity : AppCompatActivity() {

   lateinit var bottomNav : BottomNavigationView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        if(!filesDir.exists()) filesDir.mkdir()
        val jwt_file = getString(R.string.jwt_storage_file_name)
        if(!File(filesDir, jwt_file).exists()) {
            startActivity(Intent(this, LoginActivity::class.java))
            finish()
        }else{
            openFileInput(jwt_file).bufferedReader().use { line ->
                try {
//                    if (lines.count() == 1) {
//                        getPoints(lines.first())
//                    }else{
//                        println("more or less lines")
//                    }
                    setPoints(line.readText())
                } catch (e: Exception) {
                    println("exception ${e.message}")
                }
            }
        }

        val eventsList = EventsFragment()
        val clubsList = ClubsFragment()
        val rewardsList = RewardsFragment()

        loadFragment(eventsList)
        bottomNav = findViewById(R.id.navBar)
        bottomNav.menu.findItem(R.id.events).isChecked = true
        bottomNav.setOnItemSelectedListener {
            when(it.itemId) {
                R.id.clubs->loadFragment(clubsList)
                R.id.events->loadFragment(eventsList)
                R.id.rewards->loadFragment(rewardsList)
            }
            true
        }
    }

    private fun setPoints(jwt: String) {
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
                        val points = response.body()!!.points
                        findViewById<TextView>(R.id.txtPoints).text = points.toString()
                    } catch (e : Exception) {
                        startActivity(Intent(applicationContext, LoginActivity::class.java))
                        finish()
                    }


                }else{
                    println(response.raw().toString())
                    startActivity(Intent(applicationContext, LoginActivity::class.java))
                    finish()
                }
            }

            override fun onFailure(call: Call<DataModel.ProfileResponse?>?, t: Throwable) {
                print("Error doing API : " + t.message)
            }
        })
    }

    private fun loadFragment(fragment: Fragment) {
        val transaction = supportFragmentManager.beginTransaction()
        transaction.replace(R.id.container, fragment)
        transaction.commit()
    }
}