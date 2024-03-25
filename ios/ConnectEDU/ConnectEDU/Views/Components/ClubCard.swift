//
//  ClubCard.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-19.
//

import SwiftUI

struct ClubCard: View {
    var club: ClubListObject
    
    var body: some View {
        VStack {
            HStack {
                Image("club-placeholder")
                
                Spacer()
                
                Text("\(club.name)")
                    .font(.title)
                .bold()
                
                Spacer()
            }
            
            Spacer()
            
            Text("\(club.description)")
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .frame(width: 300, height: 283)
        .background(.indigoPrimary)
        .foregroundColor(.txtPrimary)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

#Preview {
    ClubCard(club:ClubListObject(id: 1, name: "Fake Club", description: "This is a very fake club that has a lot of fake users. Lets make it even longer so that it fills up the box and I can practice truncating it. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."))
        .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
}
