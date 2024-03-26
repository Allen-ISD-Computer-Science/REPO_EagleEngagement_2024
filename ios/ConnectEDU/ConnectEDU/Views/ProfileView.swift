//
//  ProfileView.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-07.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Text("Student: \(viewModel.userProfile.name)")
                    
                    Divider()
                    
                    Text(verbatim: "ID: \(viewModel.userProfile.studentID)")
                    
                    Divider()
                    
                    Text("\(viewModel.userProfile.points)")
                    
                    Divider()
                    
                    Text("\(viewModel.userProfile.grade)")
                    
                    Divider()
                    
                    Text("\(viewModel.userProfile.house)")
                }
                .font(.title2)
                .bold()
                .padding()
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.7)
                .foregroundColor(.txtPrimary)
                .background(.indigoSecondary)
                .cornerRadius(11)
                
                VStack {
                    Spacer()
                    
                    LowerNav(size: CGSize(width: geometry.size.width, height: geometry.size.height * 0.125))
                }
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ProfileView()
        .environmentObject(eventsPreviewNavigationManager)
}
