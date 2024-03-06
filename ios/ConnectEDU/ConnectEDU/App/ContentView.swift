//
//  ContentView.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-01.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        switch NavigationManager.shared.currentPage {
        case .login:
            LoginView()
        case .signup:
            SignupView()
        case .verify:
            VerifyView()
        case .home:
            HomeView()
        // Add other cases as needed
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
