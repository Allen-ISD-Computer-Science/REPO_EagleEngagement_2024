//
//  VerifyView.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-05.
//

import SwiftUI

struct VerifyView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                AuthBackground()

                VStack {
                    Image("cedu-logo-full")
                        .resizable()
                        .frame(height: geometry.size.height * 0.3)
                        .padding()
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    VerifyView()
}
