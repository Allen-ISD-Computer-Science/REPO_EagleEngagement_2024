//
//  LowerNav.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-07.
//

import SwiftUI

struct LowerNav: View {
    @EnvironmentObject var navigationManager: NavigationManager

    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button {
                    navigationManager.navigate(to: .clubs)
                } label: {
                    VStack(alignment: .center) {
                        Image(systemName: "person.2.fill")
                            .font(.system(size: geometry.size.height * 0.05))

                        Text("Clubs")
                            .font(.subheadline)
                    }
                    .padding(.leading, 40)
                }

                Spacer()

                VStack(alignment: .center) {
                    Image(systemName: "calendar.badge.checkmark")
                        .font(.system(size: geometry.size.height * 0.05))

                    Text("Events")
                        .font(.subheadline)
                }

                Spacer()

                VStack(alignment: .center) {
                    Image(systemName: "medal.fill")
                        .font(.system(size: geometry.size.height * 0.05))

                    Text("Clubs")
                        .font(.subheadline)
                }
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
    LowerNav()
}
