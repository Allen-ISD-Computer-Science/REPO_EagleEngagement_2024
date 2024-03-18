//
//  ForgotPasswordViewModel.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-08.
//

import Foundation

class ForgotPasswordViewModel: ObservableObject {
    private var verifyNavigationManager: NavigationManager
    
    // Variables Here
    @Published var email: String = ""
    @Published var str_studentID: String = ""
    @Published var forgotPasswordMessage: String = ""
    
    var forgotPasswordAuthResult: Bool = false
    
    init(navigationManager: NavigationManager) {
        self.verifyNavigationManager = navigationManager
    }
    
    func forgotPassword() {
        APIService.forgotPassword(email: email, studentID: str_studentID) { result, message in
            if result == true {
                self.forgotPasswordAuthResult = true
                self.forgotPasswordMessage = "Verification successful! Redirecting..."
                self.verifyNavigationManager.navigate(to: .verify)
            } else {
                self.forgotPasswordAuthResult = false
                self.forgotPasswordMessage = "Invalid Email and or Student ID"
            }
        }
    }
    
}
