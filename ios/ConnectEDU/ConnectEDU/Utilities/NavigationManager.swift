//
//  NavigationManager.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-05.
//

import Foundation

class NavigationManager: ObservableObject {
    static let shared = NavigationManager()
    
    @Published var currentPage: Page = .login

    private var isUserAuthenticated: Bool {
        didSet {
            currentPage = isUserAuthenticated ? .home : .login
        }
    }

    init() {
        isUserAuthenticated = KeychainService.shared.retrieveToken() != nil
        currentPage = isUserAuthenticated ? .home : .login
    }

    enum Page: String, CaseIterable {
        case login
        case signup
        case verify
        case home
        // Add other pages as needed
    }

    func navigate(to page: Page) {
        currentPage = page
        // Additional logic if needed
    }

    func updateAuthenticationState(withToken token: String?) {
        if let token = token {
            KeychainService.shared.saveToken(token)
            currentPage = .home
            isUserAuthenticated = true
        } else {
            KeychainService.shared.deleteToken()
            isUserAuthenticated = false
        }
    }

    // Add methods for login, signup, and verify that handle authentication and navigation
}
