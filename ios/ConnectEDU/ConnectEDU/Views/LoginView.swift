//
//  LoginView.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
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
                    
                    VStack {
                        Image("cedu-logo-full")
                            .resizable()
                            .frame(height: geometry.size.height * 0.3)
                            .padding()
                        
                        Spacer()
                        
                        VStack {
                            TextField("Email", text: $viewModel.email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            SecureField("Password", text: $viewModel.password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            VStack {
                                Button("Login") {
                                    viewModel.login()
                                    
                                    if viewModel.loginAuthResult {
                                        NavigationManager.shared.navigate(to: .home)
                                    }
                                }
                                .padding()
                                .background(.indigoSecondary)
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                                .cornerRadius(10)
                                .padding()
                                
                                
                                Text(viewModel.loginMessage)
                                    .foregroundColor(viewModel.loginAuthResult ? .green : .red)
                                    .padding()
                            }
                            
                            Spacer()
                            
                            Button("Don't have an account? Sign Up") {
                                NavigationManager.shared.navigate(to: .signup)
                            }
                            
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    LoginView(viewModel: LoginViewModel())
}
