//
//  signupPageView.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-01.
//

import SwiftUI

struct signupPageView: View {
    
    @StateObject var viewModel = signupViewModel()
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var str_studentID = ""
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
                    Image("ae-stadium") // Replace with your image name
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
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 50)
                            .padding(.bottom, 30)
                        
                        HStack {
                            TextField("First Name", text: $firstName)
                                .disableAutocorrection(true) // Turn off autocorrection
                                .autocapitalization(.none) // Turn off autocapitalization
                                .frame(width: geometry.size.width / 2.4, height: 50)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding(.top, 10)
                            
                            Spacer()
                                
                            TextField("Last Name", text: $lastName)
                                .disableAutocorrection(true) // Turn off autocorrection
                                .autocapitalization(.none) // Turn off autocapitalization
                                .frame(width: geometry.size.width / 2.4, height: 50)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding(.top, 10)
                        }
                        .padding(.horizontal, 20)
                        
                        
                        
                        // Email Input Field
                        TextField("Email", text: $email)
                            .disableAutocorrection(true) // Turn off autocorrection
                            .autocapitalization(.none) // Turn off autocapitalization
                            .frame(width: geometry.size.width / 1.1, height: 50)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.top, 10)
                        
                        // Student ID Input Field
                        TextField("Student ID", text: $str_studentID)
                            .disableAutocorrection(true) // Turn off autocorrection
                            .autocapitalization(.none) // Turn off autocapitalization
                            .frame(width: geometry.size.width / 1.1, height: 50)
                            .background(Color.white)
                            .cornerRadius(10)
                            .keyboardType(.numberPad)
                            .padding(.top, 10)
                        
                        // Sign Up Button
                        Button(action: {
                            if isValidStudentID(str_studentID) {
//                                viewModel.signup(firstName: firstName, lastName: lastName, email: email, studentID: Int(str_studentID) ?? 0) {
                                    isActive = true
//                                }
                            } else {
                                authenticationMessage = "Invalid Student ID. Please enter a 6-digit number."
                                isAttempted = true
                            }
                        }) {
                            Text("SIGN UP")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220, height: 60)
                                .background(Color.green)
                                .cornerRadius(15.0)
                        }
                        .padding(.top, 20)
                        
                        // Error Message Display
                        if isAttempted {
                            Text(authenticationMessage)
                                .foregroundColor(.red)
                                .padding(.top, 10)
                        }
                        
                        Spacer()
                        // ****** TODO *********
                        // - Change to navigate to Verify then to Home Page
                        // Navigation to Login View
                        
                        
                        NavigationLink(value: "Login View") {
                                            Text("Go to Login View")
                                        }
                                        .navigationDestination(for: String.self) { value in
                                            loginPageView()
                                        }
                        
                    } // VStack

                    .frame(width: geometry.size.width)
                    
                } // ZStack
            } // GeometryReader
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // Function to validate the student ID
    func isValidStudentID(_ id: String) -> Bool {
        return id.count == 6 && Int(id) != nil
    }
}

struct signupPageView_Previews: PreviewProvider {
    static var previews: some View {
        signupPageView()
    }
}
