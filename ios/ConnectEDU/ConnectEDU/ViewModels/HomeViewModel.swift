//
//  HomeViewModel.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-04.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var events: [Event] = [Event]()
    
    
    
    
    func getEvents() {
        APIService.getEvents { events, error in
            if let events = events {
                print(events)
                self.events = events
            } else if let error = error {
                print("Error when retrieving events \(error)")
            }
        }
    }
}
