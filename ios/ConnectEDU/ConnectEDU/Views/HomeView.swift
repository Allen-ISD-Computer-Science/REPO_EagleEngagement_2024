//
//  HomeView.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                ScrollView (showsIndicators: false) {
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
                
                // Nav group
                VStack {
                    
                    // Upper Navbar
                    HStack {
                        VStack {
                            Image(systemName: "flag.fill")
                                .font(.system(size: geometry.size.height * 0.05))
                            
                            Text("Request")
                                .font(.subheadline)
                        }
                        .padding(.leading, 40)
                        
                        Spacer()
                        
                        
                        // POINTS PLACEHOLDER INSERT API STUFF HERE
                        Text("21")
                            .font(.system(size: geometry.size.height * 0.04))
                            .bold()
                            .offset(y: 20)
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: "person.circle")
                                .font(.system(size: geometry.size.height * 0.05))
                            
                            Text("Profile")
                                .font(.subheadline)
                        }
                        .padding(.trailing, 40)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.15)
                    .foregroundColor(.txtPrimary)
                    .background(.indigoPrimary)
                    .cornerRadius(44)
                    
                    Spacer()
                    
                    // Lower Navbar
                    HStack {
                        VStack(alignment: .center) {
                            Image(systemName: "person.2.fill")
                                .font(.system(size: geometry.size.height * 0.05))
                            
                            Text("Clubs")
                                .font(.subheadline)
                        }
                        .padding(.leading, 40)
                        
                        Spacer()
                        
                        VStack(alignment: .center) {
                            Image(systemName: "calendar.badge.checkmark")
                                .font(.system(size: geometry.size.height * 0.05))
                            
                            Text("Events")
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .center) {
                            Image(systemName: "medal.fill")
                                .font(.system(size: geometry.size.height * 0.05))
                            
                            Text("Clubs")
                                .font(.subheadline)
                        }
                        .padding(.trailing, 40)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.15)
                    .foregroundColor(.txtPrimary)
                    .background(.indigoPrimary)
                    .cornerRadius(44)
                }
                .shadow(color: .black, radius: 10)
                
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
