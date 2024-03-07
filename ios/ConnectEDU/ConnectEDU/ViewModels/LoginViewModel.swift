//
//  LoginViewModel.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-03.
//

import Foundation

class LoginViewModel: ObservableObject {
    private var navigationManager: NavigationManager

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginMessage: String = ""

    var loginAuthResult: Bool = false

    init(navigationManager: NavigationManager) {
        self.navigationManager = navigationManager
    }

    func login() {
        APIService.login(email: email, password: password) { result, message in
            DispatchQueue.main.async {
                if result == true {
                    self.loginAuthResult = true
                    self.navigationManager.updateAuthenticationState(withToken: message)
                    self.loginMessage = "Login successful! Redirecting..."
                } else {
                    self.loginAuthResult = false
                    self.loginMessage = "Invalid Email and or Password"
                }
            }
        }
    }
}
