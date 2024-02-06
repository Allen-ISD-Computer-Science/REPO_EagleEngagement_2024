import SwiftUI

struct ClubpageView: View {
    @StateObject var clubpageViewModel = ClubpageViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        ZStack(alignment: .center) {
                            Image("img_eventthumbmail_186x360")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(186.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                            VStack {
                                Image("img_arrowleft")
                                    .resizable()
                                    .frame(width: getRelativeWidth(13.0),
                                           height: getRelativeHeight(22.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.trailing, getRelativeWidth(10.0))
                                    .onTapGesture {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                Text(StringConstants.kLblEagleRobotics)
                                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(28.0)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .frame(width: getRelativeWidth(311.0),
                                           height: getRelativeHeight(45.0), alignment: .center)
                                    .shadow(color: ColorConstants.Black900, radius: 4, x: 2, y: 2)
                                    .padding(.top, getRelativeHeight(36.0))
                                    .padding(.leading, getRelativeWidth(10.0))
                            }
                            .frame(width: getRelativeWidth(324.0), height: getRelativeHeight(104.0),
                                   alignment: .center)
                            .padding(.bottom, getRelativeHeight(71.25))
                            .padding(.leading, getRelativeWidth(10.9))
                            .padding(.trailing, getRelativeWidth(25.1))
                        }
                        .hideNavigationBar()
                        .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(186.0),
                               alignment: .leading)
                        Divider()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(1.0), alignment: .leading)
                            .background(ColorConstants.WhiteA700)
                        HStack {
                            Text(StringConstants.kMsgSponsorGregor)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(15.0)))
                                .fontWeight(.heavy)
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .frame(width: getRelativeWidth(125.0),
                                       height: getRelativeHeight(72.0), alignment: .center)
                            Spacer()
                            Text(StringConstants.kMsgTimesTuesThu)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(15.0)))
                                .fontWeight(.heavy)
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .frame(width: getRelativeWidth(117.0),
                                       height: getRelativeHeight(71.0), alignment: .center)
                                .padding(.leading, getRelativeWidth(21.0))
                        }
                        .frame(width: getRelativeWidth(263.0), height: getRelativeHeight(72.0),
                               alignment: .center)
                        .padding(.top, getRelativeHeight(8.0))
                        .padding(.horizontal, getRelativeWidth(45.0))
                        Text(StringConstants.kMsgLocationSteam)
                            .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(15.0)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.WhiteA700)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(155.0), height: getRelativeHeight(25.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(7.0))
                            .padding(.bottom, getRelativeHeight(6.0))
                            .padding(.horizontal, getRelativeWidth(45.0))
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(306.0),
                           alignment: .leading)
                    .background(RoundedCorners(bottomLeft: 30.0, bottomRight: 30.0)
                        .fill(LinearGradient(gradient: Gradient(colors: [ColorConstants.Indigo900,
                                                                         ColorConstants
                                                                             .Indigo9008c]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(306.0),
                       alignment: .leading)
                VStack {
                    Text(StringConstants.kMsgEagleRobotics)
                        .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(16.0)))
                        .fontWeight(.heavy)
                        .foregroundColor(ColorConstants.Black900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(309.0), height: getRelativeHeight(103.0),
                               alignment: .topLeading)
                        .padding(.horizontal, getRelativeWidth(22.0))
                    Image("img_frame25")
                        .resizable()
                        .frame(width: getRelativeWidth(242.0), height: getRelativeHeight(37.0),
                               alignment: .center)
                        .scaledToFit()
                        .clipped()
                        .padding(.top, getRelativeHeight(120.0))
                        .padding(.horizontal, getRelativeWidth(22.0))
                    Button(action: {}, label: {
                        HStack(spacing: 0) {
                            Text(StringConstants.kLblFollow)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                .fontWeight(.heavy)
                                .padding(.horizontal, getRelativeWidth(30.0))
                                .padding(.vertical, getRelativeHeight(11.0))
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .frame(width: getRelativeWidth(192.0),
                                       height: getRelativeHeight(61.0), alignment: .center)
                                .background(RoundedCorners(topLeft: 20.0, topRight: 20.0,
                                                           bottomLeft: 20.0, bottomRight: 20.0)
                                        .fill(ColorConstants.Indigo700))
                                .padding(.top, getRelativeHeight(95.0))
                                .padding(.horizontal, getRelativeWidth(22.0))
                        }
                    })
                    .frame(width: getRelativeWidth(192.0), height: getRelativeHeight(61.0),
                           alignment: .center)
                    .background(RoundedCorners(topLeft: 20.0, topRight: 20.0, bottomLeft: 20.0,
                                               bottomRight: 20.0)
                            .fill(ColorConstants.Indigo700))
                    .padding(.top, getRelativeHeight(95.0))
                    .padding(.horizontal, getRelativeWidth(22.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(417.0),
                       alignment: .leading)
                .padding(.top, getRelativeHeight(23.0))
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

struct ClubpageView_Previews: PreviewProvider {
    static var previews: some View {
        ClubpageView()
    }
}
