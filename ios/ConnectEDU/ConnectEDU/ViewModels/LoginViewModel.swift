//
//  LoginViewModel.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import Foundation

class LoginViewModel: ObservableObject {
    private var loginNavigationManager: NavigationManager

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginMessage: String = ""

    var loginAuthResult: Bool = false

    init(navigationManager: NavigationManager) {
        self.loginNavigationManager = navigationManager
    }

    func login() {
        APIService.login(email: email, password: password) { result, message in
            DispatchQueue.main.async {
                if result == true {
                    self.loginAuthResult = true
                    self.loginNavigationManager.updateAuthenticationState(withToken: message)
                    self.loginMessage = "Login successful! Redirecting..."
                } else {
                    self.loginAuthResult = false
                    self.loginMessage = "Invalid Email and or Password"
                }
            }
        }
    }
}
