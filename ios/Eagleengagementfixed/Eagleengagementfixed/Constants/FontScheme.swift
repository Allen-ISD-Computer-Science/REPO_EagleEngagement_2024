import Foundation
import SwiftUI

class FontScheme: NSObject {
    static func kKhulaExtraBold(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kKhulaExtraBold, size: size)
    }

    static func kKhulaBold(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kKhulaBold, size: size)
    }

    static func kKanitExtraBold(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kKanitExtraBold, size: size)
    }

    static func kKrubMediumItalic(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kKrubMediumItalic, size: size)
    }

    static func fontFromConstant(fontName: String, size: CGFloat) -> Font {
        var result = Font.system(size: size)

        switch fontName {
        case "kKhulaExtraBold":
            result = self.kKhulaExtraBold(size: size)
        case "kKhulaBold":
            result = self.kKhulaBold(size: size)
        case "kKanitExtraBold":
            result = self.kKanitExtraBold(size: size)
        case "kKrubMediumItalic":
            result = self.kKrubMediumItalic(size: size)
        default:
            result = self.kKhulaExtraBold(size: size)
        }
        return result
    }

    enum FontConstant {
        /**
         * Please Add this fonts Manually
         */
        static let kKhulaExtraBold: String = "Khula-ExtraBold"
        /**
         * Please Add this fonts Manually
         */
        static let kKhulaBold: String = "Khula-Bold"
        /**
         * Please Add this fonts Manually
         */
        static let kKanitExtraBold: String = "Kanit-ExtraBold"
        /**
         * Please Add this fonts Manually
         */
        static let kKrubMediumItalic: String = "Krub-MediumItalic"
    }
}
