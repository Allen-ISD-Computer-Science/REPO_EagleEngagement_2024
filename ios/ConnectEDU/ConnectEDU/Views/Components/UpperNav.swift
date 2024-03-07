//
//  UpperNav.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-07.
//

import SwiftUI

struct UpperNav: View {
    @EnvironmentObject var navigationManager: NavigationManager

    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button {
                    navigationManager.navigate(to: .missingPoints)
                } label: {
                    VStack {
                        Image(systemName: "flag.fill")
                            .font(.system(size: geometry.size.height * 0.04))

                        Text("Request")
                            .font(.subheadline)
                    }
                    .padding(.top, 35)
                    .padding(.leading, 40)
                }

                Spacer()

                // POINTS PLACEHOLDER INSERT API STUFF HERE
                Text("21")
                    .font(.system(size: geometry.size.height * 0.04))
                    .bold()
                    .offset(y: 20)

                Spacer()

                VStack {
                    Image(systemName: "person.circle")
                        .font(.system(size: geometry.size.height * 0.04))

                    Text("Profile")
                        .font(.subheadline)
                }
                .padding(.top, 35)
                .padding(.trailing, 40)
            }
            .frame(width: geometry.size.width, height: geometry.size.height * 0.15)
            .foregroundColor(.txtPrimary)
            .background(.indigoPrimary)
            .cornerRadius(44)
        }
    }
}

#Preview {
    UpperNav()
}
