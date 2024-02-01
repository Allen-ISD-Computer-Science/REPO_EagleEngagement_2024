//
//  LoginpageView.swift
//  Eagleengagementfixed
//
//  Created by Logan Rohlfs on 1/29/24.
//

import SwiftUI


struct LoginpageView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .top) {
                    // Full-screen solid color background
                    Rectangle()
                        .foregroundColor(Color("Indigo900"))
                        .edgesIgnoringSafeArea(.all)

                    // Image with gradient overlay
                    Image("img_eaglestadium") // Replace with your image name
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height / 1.8) // Adjust the fraction here
                        .clipped()
                        .overlay(
                            Color.black.opacity(0.6)
                        )
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [.clear, Color("Indigo900")]), startPoint: .center, endPoint: .bottom)
                        )
                        
                        .blur(radius:1)
                        .edgesIgnoringSafeArea(.top)
                    
                    // Content Stack
                    VStack(spacing:30) {
                        
                        // Eagle Engagement Logo
                        Image("img_eagleengagementlogo")
                        
                        // Page Label
                        Text("Sign In")
                            .foregroundColor(Color("txt_primary"))
                            .font(Font.largeTitle.weight(.bold))
                        
                        TextField("", text: $username)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color("Indigo700").opacity(0.5))
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(wrongUsername))
                            .foregroundColor(Color("txt_primary"))
                            .placeholder(when: username.isEmpty) {
                                Text("Enter Username").foregroundColor(Color("txt_primary")).padding()
                            }
                        
                        SecureField("", text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color("Indigo700").opacity(0.5))
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(wrongPassword))
                            .foregroundColor(Color("txt_primary"))
                            .placeholder(when: password.isEmpty) {
                                Text("Enter Password").foregroundColor(Color("txt_primary")).padding()
                            }
                        
                        Button("Sign In") {
                            // Authenticate User
                            authenticateUser(username: username, password: password)
                        }
                        .foregroundColor(Color("txt_primary"))
                        .font(Font.title.weight(.bold))
                        .frame(width: 200, height: 50)
                        .background(Color("Indigo700"))
                        .cornerRadius(10)
                        
                        NavigationLink(destination: HomepageView(), isActive: $showingLoginScreen){
                            EmptyView()
                        }

                        
                    }
                    .frame(width: geometry.size.width)
                }
            }
            
        }
        .navigationBarHidden(true)
    }
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "testuser" {
            wrongUsername = 0
            if password.lowercased() == "password" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
            
}



struct LoginpageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginpageView()
    }
}
