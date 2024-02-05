import SwiftUI

// Define your EventThumbnail as a SwiftUI View
struct EventThumbnailView: View {
    var imageName: String
    var eventTitle: String
    var eventDate: String
    var eventLocation: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)

            Text(eventTitle)
                .font(.headline)
                .foregroundColor(.primary)

            Text(eventDate)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text(eventLocation)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// You can create a preview for your custom view to see how it looks in the Xcode canvas.
struct EventThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        EventThumbnailView(imageName: "placeholder_image", eventTitle: "Sample Event", eventDate: "Jan. 1st @ 7 PM", eventLocation: "Sample Stadium")
    }
}
