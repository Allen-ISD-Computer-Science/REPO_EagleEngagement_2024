//
//  VerifyView.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-05.
//

import SwiftUI

struct VerifyView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel: VerifyViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                AuthBackground()
                
                VStack {
                    Image("cedu-logo-full")
                        .resizable()
                        .frame(height: geometry.size.height * 0.3)
                        .padding()
                    
                    Text("Verify")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.txtPrimary)
                    
                    Spacer()
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled(true)
                        .autocapitalization(/*@START_MENU_TOKEN@*/ .none/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    
                    TextField("Code", text: $viewModel.token)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled(true)
                        .autocapitalization(/*@START_MENU_TOKEN@*/ .none/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    
                    TextField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled(true)
                        .autocapitalization( .none)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    
                    TextField("Confirm Password", text: $viewModel.passwordConfirm)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled(true)
                        .autocapitalization(/*@START_MENU_TOKEN@*/ .none/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    
                    // Verify Button
                    
                    VStack {
                        Button("Verify") {
                            viewModel.verify()

                            if viewModel.verifyAuthResult {
                                navigationManager.navigate(to: .home)
                            }
                        }
                        .padding()
                        .background(.indigoSecondary)
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .cornerRadius(10)
                        .padding()

                        Text(viewModel.verifyMessage)
                            .foregroundColor(viewModel.verifyAuthResult ? .green : .red)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Button {
                        navigationManager.navigate(to: .login)
                    } label: {
                        Text("Already have an account? Sign In")
                    }
                    
//                Reference
//                  email: String
//                  token: String
//                  password: String
//                  passwordConfirm: String
                    
                }
            }
        }
    }
}

// Create a sample or mock NavigationManager for preview purposes
let verifyPreviewNavigationManager = NavigationManager()

// Initialize VerifyViewModel with the preview NavigationManager
let verifyPreviewViewModel = VerifyViewModel(navigationManager: verifyPreviewNavigationManager)

struct verifyView_Previews: PreviewProvider {
    static var previews: some View {
        // Inject the preview ViewModel into VerifyView
        VerifyView(viewModel: verifyPreviewViewModel)
            .environmentObject(verifyPreviewNavigationManager) // If LoginView still uses NavigationManager as an @EnvironmentObject
    }
}
