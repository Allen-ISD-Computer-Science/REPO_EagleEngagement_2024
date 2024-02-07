import SwiftUI

struct LoginpageView: View {
    @StateObject var loginpageViewModel = LoginpageViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    VStack {
                        ZStack(alignment: .center) {
                            ZStack(alignment: .bottomLeading) {
                                // Login Background Image
                                

//                                Image("img_loginbackgroun")
//                                    .resizable()
//                                    .frame(width: UIScreen.main.bounds.width,
//                                           height: getRelativeHeight(443.0),
//                                           alignment: .topLeading)
//                                    .scaledToFit()
//                                    .clipped()
                                ZStack(alignment: .center) {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(StringConstants.kLblStudentId)
                                            .font(FontScheme
                                                .kKhulaExtraBold(size: getRelativeHeight(16.0)))
                                            .fontWeight(.heavy)
                                            .foregroundColor(ColorConstants.WhiteA700)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(81.0),
                                                   height: getRelativeHeight(26.0),
                                                   alignment: .topLeading)
                                            .padding(.trailing)
                                        VStack {
                                            Text(StringConstants.kLbl257385)
                                                .font(FontScheme
                                                    .kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                                .fontWeight(.heavy)
                                                .foregroundColor(ColorConstants.WhiteA700)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: getRelativeWidth(80.0),
                                                       height: getRelativeHeight(39.0),
                                                       alignment: .topLeading)
                                                .padding(.vertical, getRelativeHeight(12.0))
                                                .padding(.horizontal, getRelativeWidth(72.0))
                                        }
                                        .frame(width: getRelativeWidth(224.0),
                                               height: getRelativeHeight(64.0), alignment: .leading)
                                        .background(RoundedCorners(topRight: 30.0, bottomLeft: 30.0)
                                            .fill(ColorConstants.Indigo700))
                                        .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0,
                                                y: 4)
                                    }
                                    .frame(width: getRelativeWidth(224.0),
                                           height: getRelativeHeight(89.0), alignment: .center)
                                    .padding(.top, getRelativeHeight(280.43))
                                    .padding(.horizontal, getRelativeWidth(68.0))
                                    Text(StringConstants.kLblLogin)
                                        .font(FontScheme
                                            .kKhulaExtraBold(size: getRelativeHeight(28.0)))
                                        .fontWeight(.heavy)
                                        .foregroundColor(ColorConstants.WhiteA700)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.center)
                                        .frame(width: getRelativeWidth(277.0),
                                               height: getRelativeHeight(30.0), alignment: .center)
                                        .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0,
                                                y: 4)
                                        .padding(.top, getRelativeHeight(213.0))
                                        .padding(.horizontal, getRelativeWidth(42.0))
                                    ZStack(alignment: .center) {
                                        VStack {
//                                            Image("img_alleneagles3l")
//                                                .resizable()
//                                                .frame(width: getRelativeWidth(150.0),
//                                                       height: getRelativeHeight(85.0),
//                                                       alignment: .center)
//                                                .scaledToFit()
//                                                .clipped()
//                                                .padding(.horizontal, getRelativeWidth(63.0))
//                                            Text(StringConstants.kLblEngagement)
//                                                .font(FontScheme
//                                                    .kKhulaExtraBold(size: getRelativeHeight(32.0)))
//                                                .fontWeight(.heavy)
//                                                .foregroundColor(ColorConstants.WhiteA700)
//                                                .minimumScaleFactor(0.5)
//                                                .multilineTextAlignment(.center)
//                                                .frame(width: getRelativeWidth(277.0),
//                                                       height: getRelativeHeight(109.0),
//                                                       alignment: .center)
//                                                .shadow(color: ColorConstants.Black9003f, radius: 4,
//                                                        x: 0, y: 4)
//                                                .padding(.top, getRelativeHeight(60.0))
                                        }
                                        .frame(width: getRelativeWidth(277.0),
                                               height: getRelativeHeight(254.0), alignment: .center)
                                        .padding(.bottom, getRelativeHeight(54.0))
                                        .padding(.horizontal, getRelativeWidth(42.0))
                                        ZStack(alignment: .center) {
//                                            Text(StringConstants.kLblEagle)
//                                                .font(FontScheme
//                                                    .kKhulaExtraBold(size: getRelativeHeight(96.0)))
//                                                .fontWeight(.heavy)
//                                                .foregroundColor(ColorConstants.Indigo901)
//                                                .minimumScaleFactor(0.5)
//                                                .multilineTextAlignment(.center)
//                                                .frame(width: getRelativeWidth(335.0),
//                                                       height: getRelativeHeight(87.0),
//                                                       alignment: .center)
//                                                .shadow(color: ColorConstants.Black9003f, radius: 4,
//                                                        x: 0, y: 4)
//                                            Text(StringConstants.kLblEagle)
//                                                .font(FontScheme
//                                                    .kKhulaExtraBold(size: getRelativeHeight(96.0)))
//                                                .fontWeight(.heavy)
//                                                .foregroundColor(ColorConstants.Indigo901)
//                                                .minimumScaleFactor(0.5)
//                                                .multilineTextAlignment(.center)
//                                                .frame(width: getRelativeWidth(306.0),
//                                                       height: getRelativeHeight(80.0),
//                                                       alignment: .center)
//                                                .shadow(color: ColorConstants.Black9003f, radius: 4,
//                                                        x: 0, y: 4)
//                                                .padding(.bottom, getRelativeHeight(7.0))
//                                                .padding(.horizontal, getRelativeWidth(14.58))
                                        }
                                        .hideNavigationBar()
                                        .frame(width: getRelativeWidth(335.0),
                                               height: getRelativeHeight(87.0), alignment: .center)
                                        .padding(.bottom, getRelativeHeight(173.0))
                                        .padding(.horizontal, getRelativeWidth(12.0))
                                        // Eagle Engagement Logo
                                        Image("img_image2")
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width,
                                                   height: getRelativeHeight(313.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                    }
                                    .hideNavigationBar()
                                    .frame(width: UIScreen.main.bounds.width,
                                           height: getRelativeHeight(313.0), alignment: .topLeading)
                                    .padding(.bottom, getRelativeHeight(57.0))
                                }
                                .hideNavigationBar()
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(370.0),
                                       alignment: .bottomLeading)
                                .padding(.top, getRelativeHeight(65.0))
                            }
                            .hideNavigationBar()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(443.0), alignment: .leading)
                            Text(StringConstants.kMsgForgotPassword)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(14.0)))
                                .fontWeight(.heavy)
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(120.0),
                                       height: getRelativeHeight(23.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(437.11))
                                .padding(.horizontal, getRelativeWidth(119.68))
                        }
                        .hideNavigationBar()
                        .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(460.0),
                               alignment: .leading)
                        Text(StringConstants.kLblPassword)
                            .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(16.0)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.WhiteA700)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(74.0), height: getRelativeHeight(26.0),
                                   alignment: .topLeading)
                            .padding(.horizontal, getRelativeWidth(68.0))
                        VStack {
                            Text(StringConstants.kLbl)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                .fontWeight(.heavy)
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(146.0),
                                       height: getRelativeHeight(39.0), alignment: .topLeading)
                                .padding(.vertical, getRelativeHeight(8.0))
                                .padding(.horizontal, getRelativeWidth(39.0))
                        }
                        .frame(width: getRelativeWidth(224.0), height: getRelativeHeight(64.0),
                               alignment: .center)
                        .background(RoundedCorners(topRight: 30.0, bottomLeft: 30.0)
                            .fill(ColorConstants.Indigo700))
                        .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0, y: 4)
                        .padding(.horizontal, getRelativeWidth(68.0))
                        Text(StringConstants.kLblCreateAccount)
                            .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(14.0)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.WhiteA700)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(104.0), height: getRelativeHeight(23.0),
                                   alignment: .topLeading)
                            .padding(.horizontal, getRelativeWidth(68.0))
                        Image("img_usercicrle_white_a700")
                            .resizable()
                            .frame(width: getRelativeWidth(33.0), height: getRelativeHeight(36.0),
                                   alignment: .center)
                            .scaledToFit()
                            .clipped()
                            .padding(.top, getRelativeHeight(160.0))
                            .padding(.horizontal, getRelativeWidth(68.0))
                        Text(StringConstants.kLblSupport)
                            .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(15.0)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.WhiteA700)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(58.0), height: getRelativeHeight(25.0),
                                   alignment: .topLeading)
                            .padding(.horizontal, getRelativeWidth(68.0))
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                           alignment: .topLeading)
                    .background(ColorConstants.Indigo901)
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.Indigo901)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: HomepageView(),
                                   tag: "HomepageView",
                                   selection: $loginpageViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                }
            }
            
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(ColorConstants.Indigo901)
            .ignoresSafeArea()
            .hideNavigationBar()
        }
        Image("img_loginbackgroun")
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
            .clipped()
            .edgesIgnoringSafeArea(.top)
        .hideNavigationBar()
    }
}

struct LoginpageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginpageView()
    }
}