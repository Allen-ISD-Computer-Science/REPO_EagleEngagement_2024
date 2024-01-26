package com.ahscs.eagleengagement

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.LinearLayout
import androidx.fragment.app.Fragment

class EventsFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_home_page, container, false)
        configureBtns(view)
        return view
    }

    private fun configureBtns(view: View) {
        val profileBtn = view.findViewById<ImageView>(R.id.eventProfileBtn)
        profileBtn.setOnClickListener {
            activity?.startActivity(Intent(activity, ProfileActivity::class.java))
        }

        val requestBtn = view.findViewById<LinearLayout>(R.id.eventRequestBtn)
        requestBtn.setOnClickListener {
            activity?.startActivity(Intent(activity, RequestActivity::class.java))
        }
    }

}