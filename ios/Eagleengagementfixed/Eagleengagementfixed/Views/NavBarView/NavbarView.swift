import SwiftUI

struct NavbarView: View {
    var body: some View {
        HStack {
            Text("My App")
                .font(.title)
            Spacer()
            // Add more navbar items here
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
    }
}
