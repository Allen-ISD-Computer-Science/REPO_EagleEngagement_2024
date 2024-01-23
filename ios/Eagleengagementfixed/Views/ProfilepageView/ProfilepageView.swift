import SwiftUI

struct ProfilepageView: View {
    @StateObject var profilepageViewModel = ProfilepageViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack {
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Image("img_usercicrle")
                            .resizable()
                            .frame(width: getRelativeWidth(52.0), height: getRelativeHeight(56.0),
                                   alignment: .center)
                            .scaledToFit()
                            .clipped()
                            .padding(.horizontal, getRelativeWidth(126.0))
                        VStack {
                            HStack {
                                HStack {
                                    Text(StringConstants.kLblPoints)
                                        .font(FontScheme
                                            .kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                        .fontWeight(.heavy)
                                        .foregroundColor(ColorConstants.WhiteA700)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(73.0),
                                               height: getRelativeHeight(34.0),
                                               alignment: .topLeading)
                                    Button(action: {}, label: {
                                        Image("img_vector_white_a700_33x33")
                                    })
                                    .frame(width: getRelativeWidth(33.0),
                                           height: getRelativeWidth(33.0), alignment: .center)
                                    .background(RoundedCorners(topLeft: 16.5, topRight: 16.5,
                                                               bottomLeft: 16.5, bottomRight: 16.5)
                                            .fill(ColorConstants.Indigo901))
                                    .padding(.leading, getRelativeWidth(10.0))
                                }
                                .frame(width: getRelativeWidth(116.0),
                                       height: getRelativeHeight(34.0), alignment: .top)
                                .padding(.bottom, getRelativeHeight(4.0))
                                Spacer()
                                ZStack(alignment: .center) {
                                    ZStack {}
                                        .hideNavigationBar()
                                        .frame(width: getRelativeWidth(33.0),
                                               height: getRelativeWidth(33.0), alignment: .leading)
                                        .background(RoundedCorners(topLeft: 16.5, topRight: 16.5,
                                                                   bottomLeft: 16.5,
                                                                   bottomRight: 16.5)
                                                .fill(ColorConstants.Indigo901))
                                    Text(StringConstants.kLbl21)
                                        .font(FontScheme
                                            .kKanitExtraBold(size: getRelativeHeight(24.0)))
                                        .fontWeight(.heavy)
                                        .foregroundColor(ColorConstants.WhiteA700)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(22.0),
                                               height: getRelativeHeight(34.0),
                                               alignment: .topLeading)
                                        .padding(.horizontal, getRelativeWidth(5.0))
                                }
                                .hideNavigationBar()
                                .frame(width: getRelativeWidth(33.0),
                                       height: getRelativeHeight(34.0), alignment: .top)
                                .padding(.bottom, getRelativeHeight(4.0))
                            }
                            .frame(width: getRelativeWidth(274.0), height: getRelativeHeight(39.0),
                                   alignment: .center)
                            .padding(.top, getRelativeHeight(11.0))
                            .padding(.horizontal, getRelativeWidth(16.0))
                            Divider()
                                .frame(width: getRelativeWidth(304.0),
                                       height: getRelativeHeight(1.0), alignment: .center)
                                .background(ColorConstants.WhiteA700)
                                .padding(.top, getRelativeHeight(4.0))
                            HStack {
                                Text(StringConstants.kLblRanking)
                                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(95.0),
                                           height: getRelativeHeight(39.0), alignment: .topLeading)
                                Spacer()
                                Text(StringConstants.kLbl50th2)
                                    .font(FontScheme.kKanitExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .padding(.horizontal, getRelativeWidth(11.0))
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .frame(width: getRelativeWidth(129.0),
                                           height: getRelativeHeight(36.0), alignment: .center)
                                    .background(ColorConstants.Indigo901)
                            }
                            .frame(width: getRelativeWidth(275.0), height: getRelativeHeight(39.0),
                                   alignment: .center)
                            .padding(.top, getRelativeHeight(6.0))
                            .padding(.horizontal, getRelativeWidth(16.0))
                            Divider()
                                .frame(width: getRelativeWidth(304.0),
                                       height: getRelativeHeight(1.0), alignment: .center)
                                .background(ColorConstants.WhiteA700)
                                .padding(.top, getRelativeHeight(7.0))
                                .padding(.horizontal, getRelativeWidth(1.0))
                            HStack {
                                Text(StringConstants.kLblRankingGrade)
                                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(95.0),
                                           height: getRelativeHeight(56.0), alignment: .topLeading)
                                Spacer()
                                Text(StringConstants.kLbl20th1)
                                    .font(FontScheme.kKanitExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .padding(.horizontal, getRelativeWidth(9.0))
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .frame(width: getRelativeWidth(121.0),
                                           height: getRelativeHeight(36.0), alignment: .center)
                                    .background(ColorConstants.Indigo901)
                                    .padding(.top, getRelativeHeight(10.0))
                                    .padding(.bottom, getRelativeHeight(9.0))
                            }
                            .frame(width: getRelativeWidth(276.0), height: getRelativeHeight(56.0),
                                   alignment: .center)
                            .padding(.vertical, getRelativeHeight(1.0))
                            .padding(.horizontal, getRelativeWidth(16.0))
                        }
                        .frame(width: getRelativeWidth(306.0), height: getRelativeHeight(172.0),
                               alignment: .leading)
                        .background(RoundedCorners(topRight: 30.0, bottomLeft: 30.0)
                            .fill(LinearGradient(gradient: Gradient(colors: [ColorConstants
                                        .Indigo902,
                                    ColorConstants
                                        .Blue9008c]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)))
                        .padding(.top, getRelativeHeight(30.0))
                        VStack {
                            ZStack(alignment: .bottomTrailing) {
                                ZStack {}
                                    .hideNavigationBar()
                                    .frame(width: getRelativeWidth(95.0),
                                           height: getRelativeHeight(36.0),
                                           alignment: .bottomTrailing)
                                    .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                               bottomLeft: 10.0, bottomRight: 10.0)
                                            .fill(ColorConstants.Indigo901))
                                    .padding(.top, getRelativeHeight(3.86))
                                    .padding(.leading, getRelativeWidth(182.0))
                                Text(StringConstants.kLbl123456)
                                    .font(FontScheme.kKanitExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(76.0),
                                           height: getRelativeHeight(36.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(4.13))
                                    .padding(.leading, getRelativeWidth(190.0))
                                HStack {
                                    Text(StringConstants.kLblStudentId)
                                        .font(FontScheme
                                            .kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                        .fontWeight(.heavy)
                                        .foregroundColor(ColorConstants.WhiteA700)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(123.0),
                                               height: getRelativeHeight(39.0),
                                               alignment: .topLeading)
                                    Text(StringConstants.kLbl123456)
                                        .font(FontScheme
                                            .kKanitExtraBold(size: getRelativeHeight(24.0)))
                                        .fontWeight(.heavy)
                                        .padding(.horizontal, getRelativeWidth(8.0))
                                        .foregroundColor(ColorConstants.WhiteA700)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.center)
                                        .frame(width: getRelativeWidth(92.0),
                                               height: getRelativeHeight(36.0), alignment: .center)
                                        .background(ColorConstants.Indigo901)
                                        .padding(.leading, getRelativeWidth(59.0))
                                }
                                .frame(width: getRelativeWidth(274.0),
                                       height: getRelativeHeight(41.0), alignment: .center)
                            }
                            .hideNavigationBar()
                            .frame(width: getRelativeWidth(277.0), height: getRelativeHeight(41.0),
                                   alignment: .center)
                            .padding(.leading, getRelativeWidth(17.0))
                            .padding(.trailing, getRelativeWidth(12.0))
                            Divider()
                                .frame(width: getRelativeWidth(304.0),
                                       height: getRelativeHeight(1.0), alignment: .center)
                                .background(ColorConstants.WhiteA700)
                                .padding(.top, getRelativeHeight(7.0))
                            HStack {
                                Text(StringConstants.kLblGrade2)
                                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(69.0),
                                           height: getRelativeHeight(39.0), alignment: .topLeading)
                                Spacer()
                                Text(StringConstants.kLblSenior)
                                    .font(FontScheme.kKanitExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .padding(.horizontal, getRelativeWidth(9.0))
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .frame(width: getRelativeWidth(93.0),
                                           height: getRelativeHeight(36.0), alignment: .center)
                                    .background(ColorConstants.Indigo901)
                            }
                            .frame(width: getRelativeWidth(275.0), height: getRelativeHeight(39.0),
                                   alignment: .center)
                            .padding(.leading, getRelativeWidth(17.0))
                            .padding(.trailing, getRelativeWidth(14.0))
                            Divider()
                                .frame(width: getRelativeWidth(304.0),
                                       height: getRelativeHeight(1.0), alignment: .center)
                                .background(ColorConstants.WhiteA700)
                                .padding(.top, getRelativeHeight(9.0))
                            HStack {
                                Text(StringConstants.kLblGender)
                                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(85.0),
                                           height: getRelativeHeight(39.0), alignment: .topLeading)
                                Spacer()
                                Text(StringConstants.kLblMale)
                                    .font(FontScheme.kKanitExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .padding(.horizontal, getRelativeWidth(11.0))
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .frame(width: getRelativeWidth(77.0),
                                           height: getRelativeHeight(36.0), alignment: .center)
                                    .background(ColorConstants.Indigo901)
                            }
                            .frame(width: getRelativeWidth(277.0), height: getRelativeHeight(39.0),
                                   alignment: .center)
                            .padding(.leading, getRelativeWidth(17.0))
                            .padding(.trailing, getRelativeWidth(12.0))
                            Divider()
                                .frame(width: getRelativeWidth(304.0),
                                       height: getRelativeHeight(1.0), alignment: .center)
                                .background(ColorConstants.WhiteA700)
                                .padding(.top, getRelativeHeight(8.0))
                            HStack {
                                Text(StringConstants.kLblHouse)
                                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(73.0),
                                           height: getRelativeHeight(39.0), alignment: .topLeading)
                                Spacer()
                                Text(StringConstants.kLbl400)
                                    .font(FontScheme.kKanitExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .padding(.horizontal, getRelativeWidth(9.0))
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .frame(width: getRelativeWidth(64.0),
                                           height: getRelativeHeight(36.0), alignment: .center)
                                    .background(ColorConstants.Indigo901)
                            }
                            .frame(width: getRelativeWidth(275.0), height: getRelativeHeight(39.0),
                                   alignment: .center)
                            .padding(.vertical, getRelativeHeight(1.0))
                            .padding(.leading, getRelativeWidth(17.0))
                            .padding(.trailing, getRelativeWidth(14.0))
                        }
                        .frame(width: getRelativeWidth(306.0), height: getRelativeHeight(201.0),
                               alignment: .leading)
                        .background(RoundedCorners(topRight: 30.0, bottomLeft: 30.0)
                            .fill(LinearGradient(gradient: Gradient(colors: [ColorConstants
                                        .Indigo902,
                                    ColorConstants
                                        .Blue9008c]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)))
                        .padding(.top, getRelativeHeight(57.0))
                        Button(action: {}, label: {
                            Image("img_vector_white_a700_50x50")
                        })
                        .frame(width: getRelativeWidth(50.0), height: getRelativeWidth(50.0),
                               alignment: .center)
                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0, bottomLeft: 10.0,
                                                   bottomRight: 10.0)
                                .fill(ColorConstants.Indigo700))
                        .padding(.top, getRelativeHeight(114.0))
                        .padding(.leading, getRelativeWidth(255.0))
                    }
                    .frame(width: getRelativeWidth(306.0), height: getRelativeHeight(681.0),
                           alignment: .center)
                    .padding(.horizontal, getRelativeWidth(27.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(681.0),
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
                .padding(.top, getRelativeHeight(21.0))
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            .background(ColorConstants.WhiteA700)
            .padding(.top, getRelativeHeight(19.0))
            .padding(.top, getRelativeHeight(30.0))
            .padding(.bottom, getRelativeHeight(10.0))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.WhiteA700)
        .ignoresSafeArea()
        .hideNavigationBar()
    }
}

struct ProfilepageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilepageView()
    }
}
