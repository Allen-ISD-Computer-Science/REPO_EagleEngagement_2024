//
//  EventCard.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-04.
//

import SwiftUI

struct EventCard: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading) {
            Text(event.name)
                .font(.headline)
//            Text(event.description)
//                .font(.subheadline)
            HStack {
                Text("Type: \(event.eventType)")
                Spacer()
                Text("Points: \(event.pointsWorth)")
            }
            .font(.caption)
            HStack {
                Text("Location: \(event.locationName)")
                Spacer()
                Text("Start: \(event.startDate, format: .dateTime.month().day().hour().minute())")
            }
            .font(.caption)
            Text("End: \(event.endDate, format: .dateTime.month().day().hour().minute())")
                .font(.caption)
        }
        .padding()
        .background(.txtPrimary)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        // Sample event data
        let sampleEvent =
            Event(
                id: 1,
                name: "Coding Workshop",
//                description: "Learn the basics of Swift programming.",
                eventType: "Workshop",
                locationName: "Room 101",
                pointsWorth: 5,
                startDate: Date(),
                endDate: Date().addingTimeInterval(3600) // 1 hour later
            )

        // Display the event cards in a list
        EventCard(event: sampleEvent)
    }
}

