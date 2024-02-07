//
//  TestUIView.swift
//  Eagleengagementfixed
//
//  Created by Logan Rohlfs on 1/29/24.
//

import SwiftUI

struct TestUIView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Text("Hello World")
            NavbarView()
            // Background Image
            Image("img_loginbackgroun")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                .clipped()
                .edgesIgnoringSafeArea(.top)
            // Background Color
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(ColorConstants.Indigo901)
                .ignoresSafeArea()
                .hideNavigationBar()
            NavbarView()
        }
    }
}

struct TestUIView_Previews: PreviewProvider {
    static var previews: some View {
        TestUIView()
    }
}
