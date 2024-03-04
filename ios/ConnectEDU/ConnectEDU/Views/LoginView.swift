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
        VStack {
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding()
            
            Button("Login") {
                viewModel.login()
            }
            .padding()
            
            Text("Authenticated?")
                .foregroundColor(viewModel.isUserAuthenticated ? .green : .red)
            
            Text(viewModel.loginMessage)
                .foregroundColor(viewModel.authResult ? .green : .red)
                .padding()
        }
        .padding()
    }
}


#Preview {
    LoginView(viewModel: LoginViewModel())
}
