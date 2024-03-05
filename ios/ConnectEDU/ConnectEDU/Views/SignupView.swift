//
//  SignupView.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-05.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel = SignupViewModel()

    
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    
                    // Background
                    VStack(spacing: 0){
                        Image("ae-stadium")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                            .blur(radius: 1.5)
                            .brightness(-0.1)
                            .overlay(LinearGradient(colors: [.clear, .indigoPrimary], startPoint: .top, endPoint: .bottom))
                        
                        Rectangle()
                        .foregroundColor(.indigoPrimary)
                    }
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    // Content
                    VStack {
                        Image("cedu-logo-full")
                            .resizable()
                            .frame(height: geometry.size.height * 0.3)
                            .padding()
                        
                        Spacer()
                        
                        // Input Boxes
                        VStack {
                            TextField("First Name", text: $viewModel.firstName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocorrectionDisabled(true)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            TextField("Last Name", text: $viewModel.lastName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocorrectionDisabled(true)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            TextField("Email", text: $viewModel.email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocorrectionDisabled(true)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            TextField("Student ID", text: $viewModel.str_studentID)
                                .autocorrectionDisabled(true)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            Button("Sign Up") {
                                viewModel.signup()
                                
                                
                            }
                            .padding()
                            .background(.indigoSecondary)
                            .foregroundColor(Color("txt-primary"))
                            .font(.title2)
                            .bold()
                            .cornerRadius(10)
                            .padding()
                            
//                            if viewModel.signupAuthResult {
                                NavigationLink("Verify", destination: VerifyView())
//                            }
                            
                            Text(viewModel.signupMessage)
                                .foregroundColor(viewModel.signupAuthResult ? .green : .red)
                                .padding()
                            
                            
                        }
                        .padding()
                        
                        Spacer()
                        
                        NavigationLink("Already have an account? Login", destination: LoginView())
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignupView(viewModel: SignupViewModel())
}
