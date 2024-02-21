package com.ahscs.eagleengagement.recyclerview

import android.app.Activity
import android.provider.ContactsContract.Data
import android.view.LayoutInflater
import android.view.View.OnClickListener
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.ahscs.eagleengagement.EventsFragment
import com.ahscs.eagleengagement.MainActivity
import com.ahscs.eagleengagement.R
import com.ahscs.eagleengagement.datamodels.DataModel

class EventAdapter(fragment: EventsFragment) : RecyclerView.Adapter<EventViewHolder>() {
    val context = fragment
    private var eventList = mutableListOf<DataModel.EventResponse>()
    private var onClickListener: OnClickListener? = null

    fun updateEvents(events: MutableList<DataModel.EventResponse>) {
        eventList = events
        notifyDataSetChanged()
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): EventViewHolder {
        val layout = R.layout.row_event

        val view = LayoutInflater
            .from(parent.context)
            .inflate(layout, parent, false)

        return EventViewHolder(view)
    }

    override fun onBindViewHolder(holder: EventViewHolder, position: Int) {
        //update info
        val event = eventList[position]
        holder.updateInfo(event)
        holder.itemView.setOnClickListener {
            onClickListener!!.onClick(position, event)
        }
    }

    override fun getItemCount(): Int {
        return eventList.size
    }

    fun setOnClickListener(onClickListener: OnClickListener) {
        this.onClickListener = onClickListener
    }

    interface OnClickListener {
        fun onClick(position: Int, model: DataModel.EventResponse)
    }
}