//
//  SignupViewModel.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-05.
//

import Foundation

class SignupViewModel: ObservableObject {
    private var navigationManager: NavigationManager
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var str_studentID: String = ""
    @Published var signupMessage: String = ""
    
    var signupAuthResult: Bool = false
    
    init(navigationManager: NavigationManager) {
        self.navigationManager = navigationManager
    }
    
    func signup() {
        if str_studentID.count == 6 {
            APIService.signup(firstName: firstName, lastName: lastName, email: email, studentID: str_studentID) { result, message in
                DispatchQueue.main.async {
                    if result == true {
                        self.signupAuthResult = true
                        self.signupMessage = "Sign Up successful! Redirecting..."
                    } else {
                        self.signupAuthResult = false
                        self.signupMessage = "Sign Up Failed Message: \(message ?? "No Message")"
                    }
                }
            }
        } else {
            self.signupMessage = "Invalid Student ID"
        }
    }
}
