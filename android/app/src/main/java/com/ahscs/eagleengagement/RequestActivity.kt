package com.ahscs.eagleengagement

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.ImageView

class RequestActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_point_requests_page)
        configureBtns()
    }

    private fun configureBtns() {
        val backBtn = findViewById<ImageView>(R.id.rewardBackBtn)
        backBtn.setOnClickListener {
            finish()
        }
    }
}