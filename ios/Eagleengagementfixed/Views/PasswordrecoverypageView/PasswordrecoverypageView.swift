import SwiftUI

struct PasswordrecoverypageView: View {
    @StateObject var passwordrecoverypageViewModel = PasswordrecoverypageViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack {
                VStack {
                    ZStack(alignment: .center) {
                        Image("img_loginbackgroun")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(443.0), alignment: .center)
                            .scaledToFit()
                            .clipped()
                        VStack {
                            ZStack(alignment: .leading) {
                                Text(StringConstants.kMsgPasswordRecove)
                                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(28.0)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .frame(width: getRelativeWidth(277.0),
                                           height: getRelativeHeight(30.0), alignment: .center)
                                    .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0, y: 4)
                                    .padding(.top, getRelativeHeight(208.0))
                                    .padding(.horizontal, getRelativeWidth(30.0))
                                VStack {
                                    ZStack(alignment: .center) {
                                        ZStack(alignment: .center) {
                                            Text(StringConstants.kLblEagle)
                                                .font(FontScheme
                                                    .kKhulaExtraBold(size: getRelativeHeight(96.0)))
                                                .fontWeight(.heavy)
                                                .foregroundColor(ColorConstants.Indigo901)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.center)
                                                .frame(width: getRelativeWidth(335.0),
                                                       height: getRelativeHeight(87.0),
                                                       alignment: .center)
                                                .shadow(color: ColorConstants.Black9003f, radius: 4,
                                                        x: 0, y: 4)
                                            Text(StringConstants.kLblEagle)
                                                .font(FontScheme
                                                    .kKhulaExtraBold(size: getRelativeHeight(96.0)))
                                                .fontWeight(.heavy)
                                                .foregroundColor(ColorConstants.Indigo901)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.center)
                                                .frame(width: getRelativeWidth(306.0),
                                                       height: getRelativeHeight(80.0),
                                                       alignment: .center)
                                                .shadow(color: ColorConstants.Black9003f, radius: 4,
                                                        x: 0, y: 4)
                                                .padding(.bottom, getRelativeHeight(7.0))
                                                .padding(.horizontal, getRelativeWidth(14.58))
                                        }
                                        .hideNavigationBar()
                                        .frame(width: getRelativeWidth(335.0),
                                               height: getRelativeHeight(87.0),
                                               alignment: .bottomLeading)
                                        .padding(.top, getRelativeHeight(48.0))
                                        Image("img_alleneagles3l")
                                            .resizable()
                                            .frame(width: getRelativeWidth(150.0),
                                                   height: getRelativeHeight(85.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                            .padding(.bottom, getRelativeHeight(50.0))
                                            .padding(.horizontal, getRelativeWidth(93.0))
                                    }
                                    .hideNavigationBar()
                                    .frame(width: getRelativeWidth(335.0),
                                           height: getRelativeHeight(135.0), alignment: .leading)
                                    Text(StringConstants.kLblEngagement)
                                        .font(FontScheme
                                            .kKhulaExtraBold(size: getRelativeHeight(32.0)))
                                        .fontWeight(.heavy)
                                        .foregroundColor(ColorConstants.WhiteA700)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.center)
                                        .frame(width: getRelativeWidth(277.0),
                                               height: getRelativeHeight(109.0), alignment: .center)
                                        .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0,
                                                y: 4)
                                        .padding(.top, getRelativeHeight(9.0))
                                        .padding(.horizontal, getRelativeWidth(30.0))
                                }
                                .frame(width: getRelativeWidth(335.0),
                                       height: getRelativeHeight(254.0), alignment: .leading)
                            }
                            .hideNavigationBar()
                            .frame(width: getRelativeWidth(335.0), height: getRelativeHeight(254.0),
                                   alignment: .leading)
                            Text(StringConstants.kLblStudentId)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(16.0)))
                                .fontWeight(.heavy)
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(81.0),
                                       height: getRelativeHeight(26.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(21.0))
                                .padding(.horizontal, getRelativeWidth(56.0))
                            VStack {
                                Text(StringConstants.kLbl257385)
                                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(80.0),
                                           height: getRelativeHeight(39.0), alignment: .topLeading)
                                    .padding(.vertical, getRelativeHeight(12.0))
                                    .padding(.horizontal, getRelativeWidth(72.0))
                            }
                            .frame(width: getRelativeWidth(224.0), height: getRelativeHeight(64.0),
                                   alignment: .center)
                            .background(RoundedCorners(topRight: 30.0, bottomLeft: 30.0)
                                .fill(ColorConstants.Indigo700))
                            .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0, y: 4)
                            .padding(.horizontal, getRelativeWidth(56.0))
                        }
                        .frame(width: getRelativeWidth(335.0), height: getRelativeHeight(365.0),
                               alignment: .center)
                        .padding(.top, getRelativeHeight(70.0))
                        .padding(.horizontal, getRelativeWidth(12.0))
                    }
                    .hideNavigationBar()
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(443.0),
                           alignment: .leading)
                    Image("img_usercicrle_white_a700")
                        .resizable()
                        .frame(width: getRelativeWidth(33.0), height: getRelativeHeight(36.0),
                               alignment: .center)
                        .scaledToFit()
                        .clipped()
                        .padding(.top, getRelativeHeight(293.0))
                        .padding(.horizontal, getRelativeWidth(150.0))
                    Text(StringConstants.kLblSupport)
                        .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(15.0)))
                        .fontWeight(.heavy)
                        .foregroundColor(ColorConstants.WhiteA700)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(58.0), height: getRelativeHeight(25.0),
                               alignment: .topLeading)
                        .padding(.horizontal, getRelativeWidth(150.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                       alignment: .topLeading)
                .background(ColorConstants.Indigo901)
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            .background(ColorConstants.Indigo901)
            .padding(.top, getRelativeHeight(30.0))
            .padding(.bottom, getRelativeHeight(10.0))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.Indigo901)
        .ignoresSafeArea()
        .hideNavigationBar()
    }
}

struct PasswordrecoverypageView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordrecoverypageView()
    }
}
