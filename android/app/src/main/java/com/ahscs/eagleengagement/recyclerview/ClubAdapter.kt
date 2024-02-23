package com.ahscs.eagleengagement.recyclerview

import android.app.Activity
import android.provider.ContactsContract.Data
import android.view.LayoutInflater
import android.view.View.OnClickListener
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.ahscs.eagleengagement.ClubsFragment
import com.ahscs.eagleengagement.MainActivity
import com.ahscs.eagleengagement.R
import com.ahscs.eagleengagement.datamodels.DataModel

class ClubAdapter(fragment: ClubsFragment) : RecyclerView.Adapter<ClubViewHolder>() {
    val context = fragment
    private var clubList = mutableListOf<DataModel.ClubResponse>()
    private var onClickListener: OnClickListener? = null

    fun updateClubs(clubs: MutableList<DataModel.ClubResponse>) {
        clubList = clubs
        notifyDataSetChanged()
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ClubViewHolder {
        val layout = R.layout.row_club

        val view = LayoutInflater
            .from(parent.context)
            .inflate(layout, parent, false)

        return ClubViewHolder(view)
    }

    override fun onBindViewHolder(holder: ClubViewHolder, position: Int) {
        //update info
        val club = clubList[position]
        holder.updateInfo(club)
        holder.itemView.setOnClickListener {
            onClickListener!!.onClick(position, club)
        }
    }

    override fun getItemCount(): Int {
        return clubList.size
    }

    fun setOnClickListener(onClickListener: OnClickListener) {
        this.onClickListener = onClickListener
    }

    interface OnClickListener {
        fun onClick(position: Int, model: DataModel.ClubResponse)
    }
}