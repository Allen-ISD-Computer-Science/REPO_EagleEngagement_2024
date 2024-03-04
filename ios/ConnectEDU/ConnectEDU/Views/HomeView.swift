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
                
                List {
                    ForEach(viewModel.events) { event in
                        EventCard(event: event)
                    }
                }
                .frame(height: geometry.size.height * 0.8)
                
                .navigationBarTitle("Events")
                .onAppear {
                    viewModel.getEvents()
                }
                
                // Nav group
                VStack {
                    HStack {
                        Image(systemName: "flag.fill")
                            .font(.system(size: geometry.size.height * 0.05))
                            .padding(.leading, 40)
                        
                        Spacer()
                        
                        
                        // POINTS PLACEHOLDER INSERT API STUFF HERE
                        Text("21")
                            .font(.system(size: geometry.size.height * 0.04))
                            .bold()
                            .offset(y: 20)
                        
                        Spacer()
                        
                        Image(systemName: "person.circle")
                            .font(.system(size: geometry.size.height * 0.05))
                            .padding(.trailing, 40)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.15)
                    .foregroundColor(.txtPrimary)
                    .background(.indigoPrimary)
                    .cornerRadius(44)
                    
                    Spacer()
                    
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
                
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
