//
//  ContentView.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-01.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isUserAuthenticated") private var isUserAuthenticated: Bool = false
    
    var body: some View {
        Group {
            if isUserAuthenticated {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Set the value for the preview
        UserDefaults.standard.set(true, forKey: "isUserAuthenticated")

        return ContentView()
    }
}

