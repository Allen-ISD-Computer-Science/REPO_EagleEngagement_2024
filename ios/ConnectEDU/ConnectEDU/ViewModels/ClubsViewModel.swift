//
//  ClubsViewModel.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-19.
//

import Foundation

class ClubsViewModel: ObservableObject {
    @Published var clubs: [ClubListObject] = .init()
    @Published var userProfile: Profile?

//    func getEvents() {
//        APIService.getEvents { events, error in
//            if let events = events {
//                self.events = events
//            } else if let error = error {
//                print("Error when retrieving events Error: \(error)")
//            }
//        }
//    }
    
    func getClubs() {
//        print("Getting Clubs")
        APIService.getClubs { clubs, error in
//            print("Clubs: \(clubs) Error: \(error ?? "No Error")")
            if let clubs = clubs {
                self.clubs = clubs
            } else if let error = error {
                print("Error when retrieving clubs Error: \(error)")
            }
        }
    }
    
    func getProfile() {
        APIService.getProfile { profile, error in
            if let profile = profile {
                self.userProfile = profile
            } else if let error = error {
                print("Error when retrieving Profile Points Error: \(error)")
            }
        }
    }
}
