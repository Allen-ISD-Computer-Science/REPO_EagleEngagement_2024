package com.ahscs.eagleengagement

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import androidx.fragment.app.Fragment

class ClubsFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_clubs_page, container, false)
        configureBtns(view)
        return view
    }

    private fun configureBtns(view: View) {
        val profileBtn = view.findViewById<ImageView>(R.id.clubProfileBtn)
        profileBtn.setOnClickListener {
            activity?.startActivity(Intent(activity, ProfileActivity::class.java))
        }
    }

}