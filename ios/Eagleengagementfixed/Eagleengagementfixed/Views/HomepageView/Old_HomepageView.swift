import SwiftUI

struct HomepageView: View {
    @StateObject var homepageViewModel = HomepageViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack {
                VStack {
                    VStack {
                        HStack {
                            HStack {
                                VStack {
                                    // Missing Points Flag
                                    Image("img_vector_indigo_901_28x24")
                                        .resizable()
                                        .frame(width: getRelativeWidth(24.0),
                                               height: getRelativeHeight(28.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                        .padding(.horizontal, getRelativeWidth(16.0))
                                    Text("Request")
                                        .font(FontScheme
                                            .kKhulaExtraBold(size: getRelativeHeight(14.0)))
                                        .fontWeight(.heavy)
                                        .foregroundColor(ColorConstants.Indigo901)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(56.0),
                                               height: getRelativeHeight(21.0),
                                               alignment: .topLeading)
                                }
                                .frame(width: getRelativeWidth(56.0),
                                       height: getRelativeHeight(48.0), alignment: .bottom)
                                Spacer()
                                Text(StringConstants.kLbl21)
                                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.Indigo901)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(25.0),
                                           height: getRelativeHeight(39.0), alignment: .topLeading)
                                    .padding(.bottom, getRelativeHeight(12.0))
                                Spacer()
                                Image("img_usercicrle")
                                    .resizable()
                                    .frame(width: getRelativeWidth(33.0),
                                           height: getRelativeHeight(36.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.vertical, getRelativeHeight(9.0))
                                    .padding(.trailing, getRelativeWidth(5.0))
                            }
                            .frame(width: getRelativeWidth(324.0), height: getRelativeHeight(51.0),
                                   alignment: .leading)
                        }
                        .frame(width: getRelativeWidth(324.0), height: getRelativeHeight(51.0),
                               alignment: .leading)
                        VStack(spacing: 0) {
                            ScrollView(.vertical, showsIndicators: false) {
                                LazyVStack {
                                    ForEach(0 ... 1, id: \.self) { index in
                                        Event1Cell()
                                    }
                                }
                            }
                        }
                        .frame(width: getRelativeWidth(307.0), alignment: .center)
                        .padding(.top, getRelativeHeight(12.0))
                        .padding(.horizontal, getRelativeWidth(8.0))
                    }
                    .frame(width: getRelativeWidth(324.0), height: getRelativeHeight(692.0),
                           alignment: .center)
                    .padding(.horizontal, getRelativeWidth(18.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(692.0),
                       alignment: .leading)
                VStack(alignment: .leading, spacing: 0) {
                    Text("tabbar")
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width - 20,
                               height: getRelativeHeight(78.0), alignment: .leading)
                        .background(ColorConstants.Indigo901)
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(78.0),
                       alignment: .leading)
                .padding(.top, getRelativeHeight(17.0))
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            .background(ColorConstants.WhiteA700)
            .padding(.top, getRelativeHeight(12.0))
            .padding(.top, getRelativeHeight(30.0))
            .padding(.bottom, getRelativeHeight(10.0))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.WhiteA700)
        .ignoresSafeArea()
        .hideNavigationBar()
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
