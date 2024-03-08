//
//  VerifyViewModel.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-07.
//

import Foundation

class VerifyViewModel: ObservableObject {
    private var verifyNavigationManager: NavigationManager
    
    @Published var email: String = ""
    @Published var token: String = ""
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""
    @Published var verifyMessage: String = ""
    
    var verifyAuthResult: Bool = false
    
    init(navigationManager: NavigationManager) {
        self.verifyNavigationManager = navigationManager
    }
    
    func verify() {
        APIService.verify(email: email, token: token, password: password, passwordConfirm: passwordConfirm) { result, message in
            DispatchQueue.main.async {
                if result == true {
                    self.verifyAuthResult = true
                    self.verifyNavigationManager.updateAuthenticationState(withToken: message)
                    self.verifyMessage = "Verification successful! Redirecting..."
                } else {
                    self.verifyAuthResult = false
                    self.verifyMessage = "Invalid Email/Token/Password"
                }
            }
        }
    }
    
}
