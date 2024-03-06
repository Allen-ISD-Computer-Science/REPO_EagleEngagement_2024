//
//  devView.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-05.
//

import SwiftUI

struct DevView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
            NavigationView {
                List {
                    Section(header: Text("Navigation State")) {
                        Text("Current Page: \(navigationManager.currentPage.rawValue)")
                        ForEach(NavigationManager.Page.allCases, id: \.self) { page in
                            Button("Set Page to \(page.rawValue)") {
                                navigationManager.navigate(to: page)
                            }
                        }
                    }
                    
                    Section(header: Text("User Data")) {
                        Button("Delete Token") {
                            KeychainService.shared.deleteToken()
                        }
                    }
                }
                .navigationBarTitle("Dev Tools", displayMode: .inline)
            }
        }
}

#Preview {
    DevView()
        .environment(NavigationManager())
}
