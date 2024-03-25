//
//  EventViewModel.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-18.
//

import Foundation

class EventViewModel: ObservableObject {
    var event_id: Int
    @Published var eventFull: Event?

    init(event_id: Int) {
        self.event_id = event_id
        getEvent() // Call getEvent() when the ViewModel is initialized
    }
    
    func getEvent() {
        APIService.getEvent(eventId: event_id) { [weak self] event, message in
            DispatchQueue.main.async {
                self?.eventFull = event
            }
        }
    }
}

