package com.ahscs.eagleengagement

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.ImageView

class ProfileActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_profile_page)
        configureBtns()
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