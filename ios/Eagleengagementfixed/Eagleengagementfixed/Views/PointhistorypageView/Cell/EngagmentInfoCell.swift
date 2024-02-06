import SwiftUI

struct EngagmentInfoCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(StringConstants.kMsgAllenVNorth)
                    .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(20.0)))
                    .fontWeight(.heavy)
                    .foregroundColor(ColorConstants.WhiteA700)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(215.0), height: getRelativeHeight(33.0),
                           alignment: .leading)
                Spacer()
                ZStack(alignment: .center) {
                    ZStack {}
                        .hideNavigationBar()
                        .frame(width: getRelativeWidth(31.0), height: getRelativeWidth(33.0),
                               alignment: .leading)
                        .background(RoundedCorners(topLeft: 16.5, topRight: 16.5, bottomLeft: 16.5,
                                                   bottomRight: 16.5)
                                .fill(ColorConstants.Indigo901))
                    Text(StringConstants.kLbl12)
                        .font(FontScheme.kKanitExtraBold(size: getRelativeHeight(24.0)))
                        .fontWeight(.heavy)
                        .foregroundColor(ColorConstants.WhiteA700)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(19.0), height: getRelativeHeight(34.0),
                               alignment: .leading)
                        .padding(.horizontal, getRelativeWidth(6.0))
                }
                .hideNavigationBar()
                .frame(width: getRelativeWidth(31.0), height: getRelativeHeight(34.0),
                       alignment: .leading)
            }
            .frame(width: getRelativeWidth(272.0), height: getRelativeHeight(34.0),
                   alignment: .leading)
            .padding(.top, getRelativeHeight(6.0))
            .padding(.horizontal, getRelativeWidth(16.0))
            Text(StringConstants.kLblEventCheckIn)
                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(16.0)))
                .fontWeight(.heavy)
                .foregroundColor(ColorConstants.WhiteA700)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.leading)
                .frame(width: getRelativeWidth(114.0), height: getRelativeHeight(26.0),
                       alignment: .leading)
                .padding(.vertical, getRelativeHeight(1.0))
                .padding(.horizontal, getRelativeWidth(16.0))
        }
        .frame(width: getRelativeWidth(304.0), alignment: .leading)
        .background(RoundedCorners(topRight: 30.0, bottomLeft: 30.0)
            .fill(LinearGradient(gradient: Gradient(colors: [ColorConstants.Indigo902,
                                                             ColorConstants.Blue9008c]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)))
        .hideNavigationBar()
    }
}

/* struct EngagmentInfoCell_Previews: PreviewProvider {

 static var previews: some View {
 			EngagmentInfoCell()
 }
 } */
