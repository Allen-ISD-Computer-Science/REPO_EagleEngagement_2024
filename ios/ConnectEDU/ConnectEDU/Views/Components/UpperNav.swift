//
//  UpperNav.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-07.
//

import SwiftUI

struct UpperNav: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var userProfile: Profile?
    
    init(userProfile: Profile) {
        self.userProfile = userProfile
    }
    
    var body: some View {
        GeometryReader { geometry in
                HStack {
                    Button {
                        navigationManager.navigate(to: .missingPoints)
                    } label: {
                        VStack {
                            Image(systemName: "flag.fill")
                                .font(.system(size: geometry.size.height * 0.04))
                            
                            Text("Request")
                                .font(.subheadline)
                        }
                        .padding(.top, 35)
                        .padding(.leading, 40)
                    }
                    
                    Spacer()
                    
                    // POINTS PLACEHOLDER INSERT API STUFF HERE
                    Text("\(userProfile?.points ?? 999)")
                        .font(.system(size: geometry.size.height * 0.04))
                        .bold()
                        .offset(y: 20)
                    
                    Spacer()
                    
                    Button {
                        navigationManager.navigate(to: .profile)
                    } label: {
                        VStack {
                            Image(systemName: "person.circle")
                                .font(.system(size: geometry.size.height * 0.04))
                            
                            Text("Profile")
                                .font(.subheadline)
                        }
                        .padding(.top, 35)
                        .padding(.trailing, 40)
                    }
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.15)
                .foregroundColor(.txtPrimary)
                .background(.indigoPrimary)
                .cornerRadius(44)
                
        }
    }
}

#Preview {
    UpperNav(userProfile: Profile(
        name: "John",
        studentID: 999999,
        points: 999,
        grade: 13,
        house: 900
    ))
}

//let name: String
//let studentID: Int
//let points: Int
//let grade: Int
//let house: Int
