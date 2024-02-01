import SwiftUI

struct ColumnellipsefiftynineCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image("img_ellipse59")
                    .resizable()
                    .frame(width: getRelativeWidth(64.0), height: getRelativeWidth(66.0),
                           alignment: .leading)
                    .scaledToFit()
                    .clipShape(Circle())
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 0) {
                    Text(StringConstants.kLblEagleRobotics)
                        .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(24.0)))
                        .fontWeight(.heavy)
                        .foregroundColor(ColorConstants.WhiteA700)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(165.0), height: getRelativeHeight(39.0),
                               alignment: .leading)
                    Image("img_frame20")
                        .resizable()
                        .frame(width: getRelativeWidth(84.0), height: getRelativeHeight(22.0),
                               alignment: .leading)
                        .scaledToFit()
                        .padding(.trailing, getRelativeWidth(10.0))
                }
                .frame(width: getRelativeWidth(165.0), height: getRelativeHeight(63.0),
                       alignment: .leading)
                .padding(.leading, getRelativeWidth(19.0))
            }
            .frame(width: getRelativeWidth(250.0), height: getRelativeHeight(66.0),
                   alignment: .leading)
            .padding(.horizontal, getRelativeWidth(8.0))
            Text(StringConstants.kMsgEagleRobotics)
                .font(FontScheme.kKhulaBold(size: getRelativeHeight(16.0)))
                .fontWeight(.bold)
                .foregroundColor(ColorConstants.WhiteA700)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.leading)
                .frame(width: getRelativeWidth(271.0), height: getRelativeHeight(103.0),
                       alignment: .leading)
                .padding(.top, getRelativeHeight(11.0))
                .padding(.bottom, getRelativeHeight(10.0))
                .padding(.horizontal, getRelativeWidth(11.0))
        }
        .frame(width: getRelativeWidth(304.0), alignment: .leading)
        .background(RoundedCorners(topRight: 30.0, bottomLeft: 30.0)
            .fill(LinearGradient(gradient: Gradient(colors: [ColorConstants.Indigo902,
                                                             ColorConstants.Indigo900E5]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)))
        .hideNavigationBar()
    }
}

/* struct ColumnellipsefiftynineCell_Previews: PreviewProvider {

 static var previews: some View {
 			ColumnellipsefiftynineCell()
 }
 } */
