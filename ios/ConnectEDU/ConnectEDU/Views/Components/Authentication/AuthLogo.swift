//
//  AuthLogo.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-08.
//

import SwiftUI

struct AuthLogo: View {
    var body: some View {
        GeometryReader { geometry in
            Image("cedu-logo-full")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    AuthLogo()
}
