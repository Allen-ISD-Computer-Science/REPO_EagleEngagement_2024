package com.ahscs.eagleengagement

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.provider.ContactsContract.Data
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import androidx.core.app.ActivityCompat
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
    private val LOCATION_PERMISSION_REQ_CODE = 1000;

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        var jwt: String? = null

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
                    jwt = line.readText()
                    setPoints(jwt!!)
                } catch (e: Exception) {
                    println("exception ${e.message}")
                }
            }
        }

        if (jwt == null) {
            throw Exception("JWT is null!")
        }

        val eventsList = EventsFragment(jwt!!)
        val clubsList = ClubsFragment(jwt!!)
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

//        if (ActivityCompat.checkSelfPermission(this,
//                Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
//            // request permission
//            ActivityCompat.requestPermissions(this,
//                arrayOf(Manifest.permission.ACCESS_FINE_LOCATION), LOCATION_PERMISSION_REQ_CODE);
//            return
//        }

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

//    override fun onRequestPermissionsResult(
//        requestCode: Int, permissions: Array<out String>, grantResults: IntArray
//    ) {
//        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
//        when (requestCode) {
//            LOCATION_PERMISSION_REQ_CODE -> {
//                if (grantResults.isNotEmpty() &&
//                    grantResults[0] == PackageManager.PERMISSION_GRANTED) {
//                    println("Permission granted")
//                    // permission granted
//                } else {
//                    // permission denied
//                    println("Permission denied")
//                    Toast.makeText(this, "You need to grant permission to access location",
//                        Toast.LENGTH_SHORT).show()
//                }
//            }
//        }
//    }
}