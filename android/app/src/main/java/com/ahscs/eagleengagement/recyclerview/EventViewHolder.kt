package com.ahscs.eagleengagement.recyclerview

import android.view.View
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.ahscs.eagleengagement.R
import com.ahscs.eagleengagement.datamodels.DataModel
import java.text.SimpleDateFormat

class EventViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

    fun updateInfo(info: DataModel.EventResponse) {
        var name : TextView = itemView.findViewById(R.id.txtEventName)
        name.text = info.name

        var points : TextView = itemView.findViewById(R.id.txtPoints)
        points.text = info.pointsWorth.toString()

        val dateFormat = SimpleDateFormat("MMM. d @ h:mm a")
        val dateString = dateFormat.format(info.startDate)
        var date : TextView = itemView.findViewById(R.id.txtDate)
        date.text = dateString

        var location : TextView = itemView.findViewById(R.id.txtLocation)
        location.text = info.locationName
    }

}