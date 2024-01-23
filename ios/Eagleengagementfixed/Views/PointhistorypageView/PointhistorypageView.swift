import SwiftUI

struct PointhistorypageView: View {
    @StateObject var pointhistorypageViewModel = PointhistorypageViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        HStack {
                            Image("img_arrowleft")
                                .resizable()
                                .frame(width: getRelativeWidth(13.0),
                                       height: getRelativeHeight(22.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                                .padding(.vertical, getRelativeHeight(10.0))
                                .padding(.leading, getRelativeWidth(10.0))
                                .onTapGesture {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            Text(StringConstants.kLblPointHistory)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(28.0)))
                                .fontWeight(.heavy)
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .frame(width: getRelativeWidth(178.0),
                                       height: getRelativeHeight(45.0), alignment: .center)
                                .shadow(color: ColorConstants.Black9007f, radius: 4, x: 2, y: 2)
                                .padding(.vertical, getRelativeHeight(22.0))
                                .padding(.leading, getRelativeWidth(66.0))
                        }
                        .frame(width: UIScreen.main.bounds.width - 20,
                               height: getRelativeHeight(100.0),
                               alignment: .leading)
                        .background(RoundedCorners(bottomLeft: 30.0, bottomRight: 30.0)
                            .fill(LinearGradient(gradient: Gradient(colors: [ColorConstants
                                        .Indigo900,
                                    ColorConstants
                                        .Indigo9008c]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)))
                    }
                    .frame(width: UIScreen.main.bounds.width - 20, height: getRelativeHeight(100.0),
                           alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(100.0),
                       alignment: .leading)
                VStack {
                    VStack(spacing: 0) {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVStack {
                                ForEach(0 ... 1, id: \.self) { index in
                                    EngagmentInfoCell()
                                }
                            }
                        }
                    }
                    .frame(width: getRelativeWidth(306.0), alignment: .center)
                    .padding(.horizontal, getRelativeWidth(27.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(185.0),
                       alignment: .leading)
                .padding(.top, getRelativeHeight(18.0))
                .padding(.bottom, getRelativeHeight(20.0))
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            .background(ColorConstants.WhiteA700)
            .padding(.top, getRelativeHeight(30.0))
            .padding(.bottom, getRelativeHeight(10.0))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.WhiteA700)
        .ignoresSafeArea()
        .hideNavigationBar()
    }
}

struct PointhistorypageView_Previews: PreviewProvider {
    static var previews: some View {
        PointhistorypageView()
    }
}
