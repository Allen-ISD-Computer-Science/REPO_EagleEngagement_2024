//
//  ConnectEDUApp.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-01.
//

import SwiftUI

@main
struct ConnectEDUApp: App {
    var navigationManager = NavigationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigationManager)
        }
    }
}
