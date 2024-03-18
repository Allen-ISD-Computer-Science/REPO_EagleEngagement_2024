//
//  EventCard.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-04.
//

import Foundation
import SwiftUI

struct EventCard: View {
    var event: Event

    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Image("ae-stadium")
                        .resizable()
                        .scaledToFill()
                        .clipped()

                    VStack {
                        HStack {
                            Text("\(event.eventType.capitalized)")
                                .font(.title3)
                                .bold()
                                .shadow(color: .black, radius: 5)
                                .padding(10)
                                .background(.indigoPrimary)
                                .cornerRadius(90)

                            Spacer()

                            Text("\(event.pointsWorth)")
                                .font(.title3)
                                .bold()
                                .shadow(color: .black, radius: 5)
                                .padding(10)
                                .background(.indigoPrimary)
                                .cornerRadius(90)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        Spacer()
                    }
                }

                Divider()
                    .overlay(.black)

                VStack {
                    Text(event.name)
                        .font(.title2)
                        .bold()

                    HStack {
                        Text("\(event.startDate.toMonthDayFormat()) @ \(event.startDate.toHourMinuteFormat())")
                            .truncationMode(.tail)

                        Divider()
                            .overlay(.white)
                            .frame(height: 15)

                        Text("\(event.locationName)")
                    }
                    .font(.title3)
                }
                .lineLimit(1)
                .padding(.top, 5)
                .padding(.bottom, 20)
                .padding(.horizontal)
            }
            .frame(width: 300, height: 283)
            .background(.indigoPrimary)
            .foregroundColor(.txtPrimary)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
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
