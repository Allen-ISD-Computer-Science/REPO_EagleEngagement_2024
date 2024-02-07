import SwiftUI

struct RewardspageView: View {
    @StateObject var rewardspageViewModel = RewardspageViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack {
                VStack {
                    VStack(alignment: .trailing, spacing: 0) {
                        HStack {
                            Text(StringConstants.kLbl21)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(24.0)))
                                .fontWeight(.heavy)
                                .foregroundColor(ColorConstants.Indigo901)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(25.0),
                                       height: getRelativeHeight(39.0), alignment: .topLeading)
                                .padding(.vertical, getRelativeHeight(1.0))
                            Image("img_usercicrle")
                                .resizable()
                                .frame(width: getRelativeWidth(33.0),
                                       height: getRelativeHeight(36.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                                .padding(.top, getRelativeHeight(5.0))
                                .padding(.leading, getRelativeWidth(102.0))
                                .padding(.trailing, getRelativeWidth(5.0))
                        }
                        .frame(width: getRelativeWidth(167.0), height: getRelativeHeight(45.0),
                               alignment: .trailing)
                        .padding(.leading)
                        .padding(.leading)
                        HStack {
                            Image("img_vector_indigo_903")
                                .resizable()
                                .frame(width: getRelativeWidth(33.0),
                                       height: getRelativeWidth(33.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                            Text(StringConstants.kLbl0Applied)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(16.0)))
                                .fontWeight(.heavy)
                                .foregroundColor(ColorConstants.Indigo700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(71.0),
                                       height: getRelativeHeight(26.0), alignment: .topLeading)
                                .padding(.bottom, getRelativeHeight(4.0))
                                .padding(.leading, getRelativeWidth(15.0))
                        }
                        .frame(width: getRelativeWidth(120.0), height: getRelativeHeight(33.0),
                               alignment: .leading)
                        .padding(.top, getRelativeHeight(43.0))
                        .padding(.trailing, getRelativeWidth(184.0))
                        VStack {
                            Text(StringConstants.kMsgFallExamExemp)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(20.0)))
                                .fontWeight(.heavy)
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(280.0),
                                       height: getRelativeHeight(33.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(19.0))
                                .padding(.leading, getRelativeWidth(15.0))
                                .padding(.trailing, getRelativeWidth(10.0))
                            Text(StringConstants.kMsgMakeSureYouM)
                                .font(FontScheme.kKhulaBold(size: getRelativeHeight(14.0)))
                                .fontWeight(.bold)
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(275.0),
                                       height: getRelativeHeight(46.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(12.0))
                                .padding(.horizontal, getRelativeWidth(15.0))
                            Text(StringConstants.kLblReadMore)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(16.0)))
                                .fontWeight(.heavy)
                                .foregroundColor(ColorConstants.Gray400)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(83.0),
                                       height: getRelativeHeight(26.0), alignment: .topLeading)
                                .padding(.vertical, getRelativeHeight(8.0))
                                .padding(.horizontal, getRelativeWidth(15.0))
                        }
                        .frame(width: getRelativeWidth(306.0), height: getRelativeHeight(169.0),
                               alignment: .leading)
                        .background(RoundedCorners(topRight: 30.0, bottomLeft: 30.0)
                            .fill(LinearGradient(gradient: Gradient(colors: [ColorConstants
                                        .Indigo902,
                                    ColorConstants
                                        .Indigo900E6]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)))
                        .padding(.top, getRelativeHeight(21.0))
                    }
                    .frame(width: getRelativeWidth(306.0), height: getRelativeHeight(312.0),
                           alignment: .center)
                    .padding(.horizontal, getRelativeWidth(27.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(312.0),
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
                .padding(.top, getRelativeHeight(392.0))
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            .background(ColorConstants.WhiteA700)
            .padding(.top, getRelativeHeight(18.0))
            .padding(.top, getRelativeHeight(30.0))
            .padding(.bottom, getRelativeHeight(10.0))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.WhiteA700)
        .ignoresSafeArea()
        .hideNavigationBar()
    }
}

struct RewardspageView_Previews: PreviewProvider {
    static var previews: some View {
        RewardspageView()
    }
}
