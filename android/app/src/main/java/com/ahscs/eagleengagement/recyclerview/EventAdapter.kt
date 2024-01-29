package com.ahscs.eagleengagement.recyclerview

import android.app.Activity
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.ahscs.eagleengagement.EventsFragment
import com.ahscs.eagleengagement.MainActivity
import com.ahscs.eagleengagement.R

class EventAdapter(fragment: EventsFragment) : RecyclerView.Adapter<EventViewHolder>() {
    val context = fragment
    private lateinit var eventViewHolder : EventViewHolder

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): EventViewHolder {
        val layout = R.layout.row_event

        val view = LayoutInflater
            .from(parent.context)
            .inflate(layout, parent, false)

        eventViewHolder = EventViewHolder(this, view)

        return eventViewHolder
    }

    override fun getItemCount(): Int {
        return 0
    }

    override fun onBindViewHolder(holder: EventViewHolder, position: Int) {

    }
}