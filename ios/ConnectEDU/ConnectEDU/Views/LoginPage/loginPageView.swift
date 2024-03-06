//
//  LoginpageView.swift
//  Eagleengagementfixed
//
//  Created by Logan Rohlfs on 1/29/24.
//

import SwiftUI

struct loginPageView: View {
    
    @StateObject var viewModel = loginViewModel()
    
    @State private var email = ""
    @State private var password = ""
    @State private var authenticationMessage = ""
    @State private var isActive = false
    @State private var isAttempted = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .top) {
                    // Full-screen solid color background
                    Rectangle()
                        .foregroundColor(Color("indigo-primary"))
                        .edgesIgnoringSafeArea(.all)

                    // Image with gradient overlay
                    Image("ae-stadium")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height / 1.8) // Adjust the fraction here
                        .clipped()
                        .overlay(
                            Color.black.opacity(0.6)
                        )
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [.clear, Color("indigo-primary")]), startPoint: .center, endPoint: .bottom)
                        )
                        
                        .blur(radius:1)
                        .edgesIgnoringSafeArea(.top)
                    
                    // Content Stack
                    VStack(spacing:30) {
                        
                        // Eagle Engagement Logo
                        Image("cedu-logo-full")
                            .resizable()
                            .scaledToFit()
                            .padding(20)
                        
                        // Page Label
                        Text("Sign In")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 30)
                        
                        // Email TextField
                        TextField("Email", text: $email)
                            .disableAutocorrection(true) // Turn off autocorrection
                                                        .autocapitalization(.none) // Turn off autocapitalization
                            .padding()
                            .background(Color.white)
                            .cornerRadius(5.0)
                            .padding(.bottom, 10)
                            .padding(.horizontal)
                        
                        // Password SecureField
                        SecureField("Password", text: $password)
                            .disableAutocorrection(true) // Turn off autocorrection
                            .autocapitalization(.none) // Turn off autocapitalization
                            .padding()
                            .background(Color.white)
                            .cornerRadius(5.0)
                            .padding(.bottom, 10)
                            .padding(.horizontal)
                        
                        // Sign In Button
                        Button(action: {
                            viewModel.login(email: email, password: password) {
                                authenticationMessage = viewModel.authenticationMessage
                                isActive = viewModel.isAuthenticated
                            }
                            isAttempted = true
                        }) {
                            Text("SIGN IN")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220, height: 60)
                                .background(Color.green)
                                .cornerRadius(15.0)
                        }
                        .padding(.bottom, 20)
                        
                        // Authentication Message Text
                        
                            Text(viewModel.isAuthenticated ? "Password was Correct" : "Password was Incorrect")
                                .foregroundColor(viewModel.isAuthenticated ? .green : .red)
                                .opacity(isAttempted ? 1 : 0)
                                .padding(.bottom, 20)
                        
                        
                        
                        // Sign Up Button
                        NavigationLink(destination: signupPageView(), isActive: $isActive) {
                            Text("Don't have an account? Sign Up")
                                .foregroundColor(.white)
                        }
                        
                    } // VStack
                } // ZStack
            } // GeometryReader
            .navigationBarHidden(true)
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct loginPageView_Previews: PreviewProvider {
    static var previews: some View {
        loginPageView()
    }
}
