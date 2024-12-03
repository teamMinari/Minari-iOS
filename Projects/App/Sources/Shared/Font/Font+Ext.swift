import SwiftUI

extension Font {
    static func pretendard(size: CGFloat, weight: CGDFont.Pretendard = .regular) -> Font {
        var font: CheongForDoFontConvertible
        
        switch weight {
        case .thin:
            font = CheongForDoFontFamily.Pretendard.thin
        case .extraLight:
            font = CheongForDoFontFamily.Pretendard.extraLight
        case .light:
            font = CheongForDoFontFamily.Pretendard.light
        case .regular:
            font = CheongForDoFontFamily.Pretendard.light
        case .medium:
            font = CheongForDoFontFamily.Pretendard.medium
        case .semiBold:
            font = CheongForDoFontFamily.Pretendard.semiBold
        case .bold:
            font = CheongForDoFontFamily.Pretendard.bold
        case .extraBold:
            font = CheongForDoFontFamily.Pretendard.extraBold
        case .black:
            font = CheongForDoFontFamily.Pretendard.black
        }
        
        return font.swiftUIFont(size: size)
    }
    
    static func rixanuai(size: CGFloat) -> Font {
        return CheongForDoFontFamily.RixInooAriDuriPro.regular.swiftUIFont(size: size)
    }
    
    
}
