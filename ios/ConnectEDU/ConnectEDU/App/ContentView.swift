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
            case .signup:
                SignupView(viewModel: SignupViewModel(navigationManager: navigationManager))
            case .verify:
                VerifyView()
            case .home:
                HomeView()
            case .dev:
                DevView()
                // Add other cases as needed
            }
        }
        .onTapGesture(count: 3) {
            // WIP: Make it such that when in dev view doing the triple tap gesture brings you back to the page you were on before switching to dev view. REQUIRES: navigationManager must keep track of views in a stack of some sort
//            navigationManager.currentPage == .dev ? navigationManager.navigate(to: .login) : navigationManager.navigate(to: .dev)
            navigationManager.navigate(to: .dev)
            
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
