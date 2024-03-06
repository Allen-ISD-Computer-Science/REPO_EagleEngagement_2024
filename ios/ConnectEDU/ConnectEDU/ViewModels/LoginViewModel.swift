//
//  LoginViewModel.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginMessage: String = ""
    var loginAuthResult: Bool
    
    
    
    init() {
        self.loginAuthResult = false
    }
    
    func login() {
        APIService.login(email: email, password: password) { result, message in
            DispatchQueue.main.async {
                if result == true {
                    self.loginAuthResult = true
                    NavigationManager.shared.updateAuthenticationState(withToken: message)
                    self.loginMessage = "Login successful! Redirecting..."
                } else {
                    self.loginAuthResult = false
                    self.loginMessage = "Invalid Email and or Password"
                }
            }
        }
    }
}

