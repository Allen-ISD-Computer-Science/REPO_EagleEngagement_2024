//
//  AuthBackground.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-07.
//

import SwiftUI

struct AuthBackground: View {
    var body: some View {
        // Background
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Image("ae-stadium")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                    .blur(radius: 1.5)
                    .brightness(-0.1)
                    .overlay(LinearGradient(colors: [.clear, .indigoPrimary], startPoint: .top, endPoint: .bottom))

                Rectangle()
                    .foregroundColor(.indigoPrimary)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    AuthBackground()
}
