//
//  ContentView.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-01.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationManager: NavigationManager

    var body: some View {
        Group {
            switch self.navigationManager.currentPage {
            case .login:
                LoginView(viewModel: LoginViewModel(navigationManager: navigationManager))
            case .forgotPassword:
                ForgotPasswordView(viewModel: ForgotPasswordViewModel(navigationManager: navigationManager))
            case .signup:
                SignupView(viewModel: SignupViewModel(navigationManager: navigationManager))
            case .verify:
                VerifyView(viewModel: VerifyViewModel(navigationManager: navigationManager))
            case .home:
                HomeView()
            case .dev:
                DevView()
            case .missingPoints:
                MissingPointsView()
            case .profile:
                ProfileView()
            case .clubs:
                ClubsView()
            case .events:
                EventsView()
            case .rewards:
                RewardsView()
                // Add other cases as needed
            }
        }
        .onTapGesture(count: 4) {
            navigationManager.currentPage == .dev ? navigationManager.back() : navigationManager.navigate(to: .dev)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of NavigationManager for previews.
        // You might need to adjust its initial state depending on the view you want to preview.
        ContentView()
            .environmentObject(NavigationManager())
    }
}
