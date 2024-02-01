import SwiftUI

struct EventpageView: View {
    @StateObject var eventpageViewModel = EventpageViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        ZStack(alignment: .center) {
                            Image("img_eventthumbmail")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(186.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                            VStack {
                                HStack {
                                    HStack {
                                        Image("img_arrowleft")
                                            .resizable()
                                            .frame(width: getRelativeWidth(13.0),
                                                   height: getRelativeHeight(22.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                            .padding(.vertical, getRelativeHeight(3.0))
                                            .onTapGesture {
                                                self.presentationMode.wrappedValue.dismiss()
                                            }
                                        Spacer()
                                        ZStack(alignment: .center) {
                                            ZStack {}
                                                .hideNavigationBar()
                                                .frame(width: getRelativeWidth(33.0),
                                                       height: getRelativeWidth(33.0),
                                                       alignment: .leading)
                                                .background(RoundedCorners(topLeft: 16.5,
                                                                           topRight: 16.5,
                                                                           bottomLeft: 16.5,
                                                                           bottomRight: 16.5)
                                                        .fill(ColorConstants.Indigo901))
                                            Text(StringConstants.kLbl10)
                                                .font(FontScheme
                                                    .kKanitExtraBold(size: getRelativeHeight(24.0)))
                                                .fontWeight(.heavy)
                                                .foregroundColor(ColorConstants.WhiteA700)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: getRelativeWidth(26.0),
                                                       height: getRelativeHeight(36.0),
                                                       alignment: .topLeading)
                                                .padding(.horizontal, getRelativeWidth(3.0))
                                        }
                                        .hideNavigationBar()
                                        .frame(width: getRelativeWidth(33.0),
                                               height: getRelativeHeight(36.0), alignment: .center)
                                    }
                                    .frame(width: getRelativeWidth(339.0),
                                           height: getRelativeHeight(36.0), alignment: .leading)
                                }
                                .frame(width: getRelativeWidth(339.0),
                                       height: getRelativeHeight(36.0), alignment: .leading)
                                Text(StringConstants.kMsgAllenVNorth)
                                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(28.0)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .frame(width: getRelativeWidth(311.0),
                                           height: getRelativeHeight(45.0), alignment: .center)
                                    .shadow(color: ColorConstants.Black900, radius: 4, x: 2, y: 2)
                                    .padding(.top, getRelativeHeight(23.0))
                                    .padding(.horizontal, getRelativeWidth(13.0))
                            }
                            .frame(width: getRelativeWidth(339.0), height: getRelativeHeight(104.0),
                                   alignment: .center)
                            .padding(.bottom, getRelativeHeight(71.73))
                            .padding(.horizontal, getRelativeWidth(10.9))
                        }
                        .hideNavigationBar()
                        .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(186.0),
                               alignment: .leading)
                        Divider()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(1.0), alignment: .leading)
                            .background(ColorConstants.WhiteA700)
                        HStack {
                            VStack {
                                Text(StringConstants.kLbl1Dec)
                                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.Black900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .frame(width: getRelativeWidth(35.0),
                                           height: getRelativeHeight(42.0), alignment: .center)
                                    .padding(.top, getRelativeHeight(8.0))
                                    .padding(.bottom, getRelativeHeight(7.0))
                                    .padding(.horizontal, getRelativeWidth(12.0))
                            }
                            .frame(width: getRelativeWidth(60.0), height: getRelativeHeight(58.0),
                                   alignment: .center)
                            .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                       bottomLeft: 10.0, bottomRight: 10.0)
                                    .fill(ColorConstants.Gray100))
                            .padding(.vertical, getRelativeHeight(12.0))
                            Text(StringConstants.kMsgFriday60090)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(20.0)))
                                .fontWeight(.heavy)
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(116.0),
                                       height: getRelativeHeight(52.0), alignment: .topLeading)
                                .padding(.vertical, getRelativeHeight(10.0))
                                .padding(.leading, getRelativeWidth(18.0))
                            Image("img_vector")
                                .resizable()
                                .frame(width: getRelativeWidth(82.0),
                                       height: getRelativeWidth(82.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                                .padding(.leading, getRelativeWidth(18.0))
                            Spacer()
                        }
                        .frame(width: getRelativeWidth(294.0), height: getRelativeHeight(82.0),
                               alignment: .center)
                        .padding(.top, getRelativeHeight(18.0))
                        .padding(.bottom, getRelativeHeight(19.0))
                        .padding(.horizontal, getRelativeWidth(32.0))
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
                    HStack {
                        Image("img_vector_bluegray_900")
                            .resizable()
                            .frame(width: getRelativeWidth(21.0), height: getRelativeHeight(27.0),
                                   alignment: .center)
                            .scaledToFit()
                            .clipped()
                            .padding(.top, getRelativeHeight(13.0))
                            .padding(.bottom, getRelativeHeight(16.0))
                        Text(StringConstants.kMsgEagleStadium1)
                            .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(18.0)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.Gray800)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(243.0), height: getRelativeHeight(56.0),
                                   alignment: .topLeading)
                            .padding(.leading, getRelativeWidth(20.0))
                    }
                    .frame(width: getRelativeWidth(284.0), height: getRelativeHeight(56.0),
                           alignment: .center)
                    .padding(.horizontal, getRelativeWidth(34.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(56.0),
                       alignment: .leading)
                .padding(.top, getRelativeHeight(28.0))
                VStack(alignment: .leading, spacing: 0) {
                    Text(StringConstants.kMsgComeOutFriday)
                        .font(FontScheme.kKhulaBold(size: getRelativeHeight(16.0)))
                        .fontWeight(.bold)
                        .foregroundColor(ColorConstants.Black900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(298.0), height: getRelativeHeight(130.0),
                               alignment: .topLeading)
                        .padding(.horizontal, getRelativeWidth(22.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(130.0),
                       alignment: .leading)
                .padding(.top, getRelativeHeight(38.0))
                VStack {
                    HStack {
                        Image("img_vector_indigo_901")
                            .resizable()
                            .frame(width: getRelativeWidth(38.0), height: getRelativeWidth(38.0),
                                   alignment: .center)
                            .scaledToFit()
                            .clipped()
                        Spacer()
                        Image("img_vector_white_a700")
                            .resizable()
                            .frame(width: getRelativeWidth(30.0), height: getRelativeHeight(34.0),
                                   alignment: .center)
                            .scaledToFit()
                            .clipped()
                    }
                    .frame(width: getRelativeWidth(268.0), height: getRelativeHeight(38.0),
                           alignment: .center)
                    .padding(.horizontal, getRelativeWidth(45.0))
                    Button(action: {}, label: {
                        HStack(spacing: 0) {
                            Text(StringConstants.kLblCheckIn)
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
                                .padding(.top, getRelativeHeight(41.0))
                                .padding(.horizontal, getRelativeWidth(45.0))
                        }
                    })
                    .frame(width: getRelativeWidth(192.0), height: getRelativeHeight(61.0),
                           alignment: .center)
                    .background(RoundedCorners(topLeft: 20.0, topRight: 20.0, bottomLeft: 20.0,
                                               bottomRight: 20.0)
                            .fill(ColorConstants.Indigo700))
                    .padding(.top, getRelativeHeight(41.0))
                    .padding(.horizontal, getRelativeWidth(45.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(140.0),
                       alignment: .leading)
                .padding(.vertical, getRelativeHeight(41.0))
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

struct EventpageView_Previews: PreviewProvider {
    static var previews: some View {
        EventpageView()
    }
}
