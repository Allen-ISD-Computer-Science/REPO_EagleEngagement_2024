//
//  HomeViewModel.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-04.
//

import Foundation

class EventsViewModel: ObservableObject {
    @Published var events: [Event] = .init()
    @Published var userProfile: Profile?

    func getEvents() {
        APIService.getEvents { events, error in
            if let events = events {
                self.events = events
            } else if let error = error {
                print("Error when retrieving events Error: \(error)")
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
