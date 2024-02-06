import SwiftUI

struct PointrequestpageView: View {
    @StateObject var pointrequestpageViewModel = PointrequestpageViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        HStack {
                            Image("img_arrowleft")
                                .resizable()
                                .frame(width: getRelativeWidth(13.0),
                                       height: getRelativeHeight(22.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                                .padding(.vertical, getRelativeHeight(10.0))
                                .padding(.leading, getRelativeWidth(15.0))
                                .onTapGesture {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            Text(StringConstants.kLblPointRequest)
                                .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(28.0)))
                                .fontWeight(.heavy)
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .frame(width: getRelativeWidth(189.0),
                                       height: getRelativeHeight(45.0), alignment: .center)
                                .shadow(color: ColorConstants.Black9007f, radius: 4, x: 2, y: 2)
                                .padding(.top, getRelativeHeight(22.0))
                                .padding(.bottom, getRelativeHeight(23.0))
                                .padding(.leading, getRelativeWidth(56.0))
                        }
                        .frame(width: UIScreen.main.bounds.width - 20,
                               height: getRelativeHeight(90.0), alignment: .leading)
                        .background(RoundedCorners(bottomLeft: 30.0, bottomRight: 30.0)
                            .fill(LinearGradient(gradient: Gradient(colors: [ColorConstants
                                        .Indigo900,
                                    ColorConstants
                                        .Indigo9008c]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)))
                    }
                    .frame(width: UIScreen.main.bounds.width - 20, height: getRelativeHeight(90.0),
                           alignment: .leading)
                    Text(StringConstants.kLblEvent)
                        .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(20.0)))
                        .fontWeight(.heavy)
                        .foregroundColor(ColorConstants.Indigo700)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(65.0), height: getRelativeHeight(29.0),
                               alignment: .topLeading)
                        .padding(.top, getRelativeHeight(20.0))
                        .padding(.horizontal, getRelativeWidth(27.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(139.0),
                       alignment: .leading)
                VStack {
                    Picker(StringConstants.kMsgAllenVNorth,
                           selection: $pointrequestpageViewModel.framethirtysevenPicker1) {
                        ForEach(pointrequestpageViewModel.framethirtysevenPicker1Values,
                                id: \.self) { value in
                            Text(value)
                        }
                    }
                    .foregroundColor(ColorConstants.WhiteA700)
                    .font(.system(size: getRelativeHeight(20)))
                    .pickerStyle(MenuPickerStyle())
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(60.0),
                       alignment: .leading)
                VStack(alignment: .leading, spacing: 0) {
                    Text(StringConstants.kMsgReasonForMiss)
                        .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(20.0)))
                        .fontWeight(.heavy)
                        .foregroundColor(ColorConstants.Indigo700)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(253.0), height: getRelativeHeight(33.0),
                               alignment: .topLeading)
                        .padding(.horizontal, getRelativeWidth(26.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(33.0),
                       alignment: .leading)
                .padding(.top, getRelativeHeight(31.0))
                VStack {
                    HStack {
                        TextField(StringConstants.kMsgInsertReasonH,
                                  text: $pointrequestpageViewModel.groupthreeText)
                            .font(FontScheme.kKrubMediumItalic(size: getRelativeHeight(16.0)))
                            .foregroundColor(ColorConstants.Gray400)
                            .padding()
                    }
                    .frame(width: getRelativeWidth(306.0), height: getRelativeHeight(90.0),
                           alignment: .center)
                    .background(RoundedCorners(topRight: 30.0, bottomLeft: 30.0)
                        .fill(LinearGradient(gradient: Gradient(colors: [ColorConstants.Indigo902,
                                                                         ColorConstants
                                                                             .Indigo900E6]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)))
                    .padding(.horizontal, getRelativeWidth(26.0))
                    Text(StringConstants.kMsgAdditionalEvid)
                        .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(20.0)))
                        .fontWeight(.heavy)
                        .foregroundColor(ColorConstants.Indigo700)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(33.0),
                               alignment: .topLeading)
                        .padding(.top, getRelativeHeight(23.0))
                        .padding(.horizontal, getRelativeWidth(26.0))
                    VStack {
                        Text(StringConstants.kLblEnterEvidence)
                            .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(16.0)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.WhiteA700)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(114.0), height: getRelativeHeight(26.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(23.0))
                            .padding(.horizontal, getRelativeWidth(96.0))
                        Text(StringConstants.kLblOr)
                            .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(16.0)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.WhiteA700)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(23.0), height: getRelativeHeight(26.0),
                                   alignment: .topLeading)
                            .padding(.horizontal, getRelativeWidth(96.0))
                        Text(StringConstants.kLblUploadImage)
                            .font(FontScheme.kKhulaExtraBold(size: getRelativeHeight(16.0)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.WhiteA700)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(106.0), height: getRelativeHeight(26.0),
                                   alignment: .topLeading)
                            .padding(.horizontal, getRelativeWidth(96.0))
                        Image("img_vector_white_a700_35x40")
                            .resizable()
                            .frame(width: getRelativeWidth(40.0), height: getRelativeHeight(35.0),
                                   alignment: .center)
                            .scaledToFit()
                            .clipped()
                            .padding(.vertical, getRelativeHeight(3.0))
                            .padding(.horizontal, getRelativeWidth(96.0))
                    }
                    .frame(width: getRelativeWidth(306.0), height: getRelativeHeight(173.0),
                           alignment: .center)
                    .background(RoundedCorners(topRight: 30.0, bottomLeft: 30.0)
                        .fill(LinearGradient(gradient: Gradient(colors: [ColorConstants.Indigo902,
                                                                         ColorConstants
                                                                             .Indigo900E6]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)))
                    .padding(.top, getRelativeHeight(5.0))
                    .padding(.horizontal, getRelativeWidth(26.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(324.0),
                       alignment: .leading)
                VStack(alignment: .leading, spacing: 0) {
                    CheckboxField(idValue: StringConstants.kMsgSendCurrentLo,
                                  label: StringConstants.kMsgSendCurrentLo,
                                  color: ColorConstants.Gray700,
                                  isMarked: $pointrequestpageViewModel.labelOneCheckbox)
                        .minimumScaleFactor(0.5)
                        .frame(width: getRelativeWidth(249.0), height: getRelativeHeight(46.0),
                               alignment: .leading)
                        .overlay(RoundedCorners(topLeft: 6.0, topRight: 6.0, bottomLeft: 6.0,
                                                bottomRight: 6.0)
                                .stroke(ColorConstants.Gray700,
                                        lineWidth: 1))
                        .background(RoundedCorners(topLeft: 6.0, topRight: 6.0, bottomLeft: 6.0,
                                                   bottomRight: 6.0)
                                .fill(ColorConstants.WhiteA700))
                        .padding(.horizontal, getRelativeWidth(35.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(46.0),
                       alignment: .leading)
                .padding(.top, getRelativeHeight(28.0))
                VStack {
                    Button(action: {}, label: {
                        HStack(spacing: 0) {
                            Text(StringConstants.kLblSubmit)
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
                                .padding(.horizontal, getRelativeWidth(84.0))
                        }
                    })
                    .frame(width: getRelativeWidth(192.0), height: getRelativeHeight(61.0),
                           alignment: .center)
                    .background(RoundedCorners(topLeft: 20.0, topRight: 20.0, bottomLeft: 20.0,
                                               bottomRight: 20.0)
                            .fill(ColorConstants.Indigo700))
                    .padding(.horizontal, getRelativeWidth(84.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(61.0),
                       alignment: .leading)
                .padding(.vertical, getRelativeHeight(33.0))
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

struct PointrequestpageView_Previews: PreviewProvider {
    static var previews: some View {
        PointrequestpageView()
    }
}
