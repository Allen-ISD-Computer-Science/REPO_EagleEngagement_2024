import SwiftUI

struct Event1Cell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .center) {
                Image("img_eventthumbmail_226x306")
                    .resizable()
                    .frame(width: getRelativeWidth(304.0), height: getRelativeHeight(226.0),
                           alignment: .leading)
                    .scaledToFit()
                    .cornerRadius(0.0)
                HStack {
                    Button(action: {}, label: {
                        Image("img_vector_white_a700_74x74")
                    })
                    .frame(width: getRelativeWidth(72.0), height: getRelativeWidth(74.0),
                           alignment: .center)
                    .background(RoundedCorners(topLeft: 37.0, topRight: 37.0, bottomLeft: 37.0,
                                               bottomRight: 37.0)
                            .fill(LinearGradient(gradient: Gradient(colors: [ColorConstants
                                        .Indigo900Bf,
                                    ColorConstants
                                        .Indigo900D8]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)))
                    Text(StringConstants.kLbl10)
                        .font(FontScheme.kKanitExtraBold(size: getRelativeHeight(24.0)))
                        .fontWeight(.heavy)
                        .padding(.horizontal, getRelativeWidth(4.0))
                        .foregroundColor(ColorConstants.WhiteA700)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .frame(width: getRelativeWidth(38.0), height: getRelativeHeight(39.0),
                               alignment: .center)
                        .background(LinearGradient(gradient: Gradient(colors: [ColorConstants
                                    .Indigo900Bf,
                                ColorConstants
                                    .Indigo900D8]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing))
                        .padding(.leading, getRelativeWidth(168.0))
                }
                .frame(width: getRelativeWidth(280.0), height: getRelativeHeight(77.0),
                       alignment: .leading)
                .padding(.bottom, getRelativeHeight(136.76))
                .padding(.leading, getRelativeWidth(14.0))
                .padding(.trailing, getRelativeWidth(10.0))
            }
            .hideNavigationBar()
            .frame(width: getRelativeWidth(304.0), height: getRelativeHeight(226.0),
                   alignment: .leading)
            Divider()
                .frame(width: getRelativeWidth(304.0), height: getRelativeHeight(1.0),
                       alignment: .leading)
                .background(ColorConstants.WhiteA700)
            VStack(alignment: .leading, spacing: 0) {
                Text(StringConstants.kMsgAllenVNorth)
                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(22.0)))
                    .fontWeight(.heavy)
                    .foregroundColor(ColorConstants.WhiteA700)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(237.0), height: getRelativeHeight(36.0),
                           alignment: .leading)
                    .padding(.trailing)
                HStack {
                    Text(StringConstants.kLblDec1st8Pm)
                        .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(16.0)))
                        .fontWeight(.heavy)
                        .foregroundColor(ColorConstants.WhiteA700)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(117.0), height: getRelativeHeight(26.0),
                               alignment: .leading)
                    Spacer()
                    Divider()
                        .frame(width: getRelativeWidth(2.0), height: getRelativeHeight(25.0),
                               alignment: .leading)
                        .background(ColorConstants.WhiteA700)
                    Spacer()
                    Text(StringConstants.kLblEagleStadium2)
                        .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(16.0)))
                        .fontWeight(.heavy)
                        .foregroundColor(ColorConstants.WhiteA700)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(106.0), height: getRelativeHeight(26.0),
                               alignment: .leading)
                }
                .frame(width: getRelativeWidth(258.0), height: getRelativeHeight(27.0),
                       alignment: .leading)
            }
            .frame(width: getRelativeWidth(258.0), height: getRelativeHeight(65.0),
                   alignment: .leading)
            .padding(.vertical, getRelativeHeight(1.0))
            .padding(.leading, getRelativeWidth(29.0))
            .padding(.trailing, getRelativeWidth(17.0))
        }
        .frame(width: getRelativeWidth(304.0), alignment: .leading)
        .background(RoundedCorners(topRight: 30.0, bottomLeft: 30.0).fill(ColorConstants.Indigo901))
        .shadow(color: ColorConstants.Black9007f, radius: 4, x: 0, y: 4)
        .hideNavigationBar()
    }
}

/* struct Event1Cell_Previews: PreviewProvider {

 static var previews: some View {
 			Event1Cell()
 }
 } */
