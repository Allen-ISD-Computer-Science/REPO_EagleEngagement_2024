//
//  HomeView.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Event Feed
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        Spacer().frame(height: 20) // Adjust this value to control the initial gap
                        
                        ForEach(viewModel.events) { event in
                            EventCard(event: event)
                                .padding(.top, event == viewModel.events.first ? 55 : 10) // Adjust this value to match the initial gap
                                .padding(.bottom, event == viewModel.events.last ? 75 : 0)
                        }
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.85)
                .background(.white)
                .navigationBarTitle("Events")
                .onAppear {
                    viewModel.getEvents()
                }
                // =========================
                
                // Nav group
                VStack {
                    // TODO: NEEDS FIX
                    UpperNav(userProfile: viewModel.userProfile ?? Profile(name: "Error", studentID: 999999, points: 0, grade: 13, house: 900))
                    Spacer()
                    
                    LowerNav()
                }
                .frame(width: geometry.size.width, height:geometry.size.height)
                .shadow(color: .black, radius: 10)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    viewModel.getProfile()
                }
                // =========================
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
