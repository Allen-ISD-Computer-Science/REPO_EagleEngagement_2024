package com.ahscs.eagleengagement

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.fragment.app.Fragment
import com.google.android.material.bottomnavigation.BottomNavigationView

class MainActivity : AppCompatActivity() {

   lateinit var bottomNav : BottomNavigationView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        loadFragment(EventsFragment())
        bottomNav = findViewById(R.id.navBar) as BottomNavigationView
        bottomNav.menu.findItem(R.id.events).isChecked = true
//        bottomNav.setOnItemSelectedListener {
//            when(it.itemId) {
//                R.id.clubs -> {
//                    loadFragment(ClubsFragment)
//                    true
//                }
//            }
//        }
    }

    private fun loadFragment(fragment: Fragment) {
        val transaction = supportFragmentManager.beginTransaction()
        transaction.replace(R.id.container, fragment)
        transaction.commit()
    }
}