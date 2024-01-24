package com.ahscs.eagleengagement

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageView
import androidx.fragment.app.Fragment
import com.google.android.material.bottomnavigation.BottomNavigationView

class MainActivity : AppCompatActivity() {

   lateinit var bottomNav : BottomNavigationView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val eventsList = EventsFragment()
        val clubsList = ClubsFragment()
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
    }

    private fun loadFragment(fragment: Fragment) {
        val transaction = supportFragmentManager.beginTransaction()
        transaction.replace(R.id.container, fragment)
        transaction.commit()
    }
}