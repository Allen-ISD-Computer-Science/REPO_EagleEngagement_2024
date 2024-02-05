package com.ahscs.eagleengagement

import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import com.ahscs.eagleengagement.datamodels.AuthDataModel
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import android.util.Base64
import java.io.File
import java.io.FileOutputStream

class LoginActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        val loginButton = findViewById<Button>(R.id.buttonLogin)
        loginButton.setOnClickListener {
            val email = findViewById<EditText>(R.id.inputLoginEmail).text.toString()
            val password = findViewById<EditText>(R.id.inputLoginPassword).text.toString()
//            postDataUsingRetrofit(email, password)
            var encodedPassword = Base64.encodeToString(password.toByteArray(), Base64.NO_WRAP)
            postDataUsingRetrofit(email, encodedPassword)
        }
    }

    private fun postDataUsingRetrofit(email: String, password: String) {
        var url = resources.getString(R.string.api_link)
        val retrofit = Retrofit.Builder()
            .baseUrl(url)
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        val retrofitAPI = retrofit.create(RetrofitAPI::class.java)
        val dataModel = AuthDataModel.LoginDataModel(email, password)
        val call: Call<AuthDataModel.response> = retrofitAPI.postLogin(dataModel)
        call!!.enqueue(object: Callback<AuthDataModel.response?> {
            override fun onResponse(
                call: Call<AuthDataModel.response?>?,
                response: Response<AuthDataModel.response?>
            ) {

                if (response.isSuccessful) {
                    Toast.makeText(applicationContext, "Successfully logged in!", Toast.LENGTH_SHORT).show()
                    try {
                        val jwt = response.body()!!.msg
                        if(!filesDir.exists()) filesDir.mkdir()
                        val jwt_file = getString(R.string.jwt_storage_file_name)
                        val fosSaved: FileOutputStream = openFileOutput(jwt_file, Context.MODE_PRIVATE)
                        fosSaved.write(jwt.toByteArray())
                        fosSaved.close()
                    } catch (e : Exception) {
                        Toast.makeText(applicationContext, "An error occurred while logging you in, try again later!", Toast.LENGTH_SHORT).show()
                    }

                    startActivity(Intent(applicationContext, MainActivity::class.java))
                    finish()
                }else{
                    println(response.raw().toString())
                    Toast.makeText(applicationContext, "Invalid login credentials!", Toast.LENGTH_SHORT).show()
                }
            }

            override fun onFailure(call: Call<AuthDataModel.response?>?, t: Throwable) {
                print("Error doing API : " + t.message)
            }
        })
    }
}