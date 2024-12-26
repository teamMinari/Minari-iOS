import SwiftUI

extension Font {
    static func pretendard(size: CGFloat, weight: CGDFont.Pretendard = .regular) -> Font {
        var font: CFDFontConvertible
        
        switch weight {
        case .thin:
            font = CFDFontFamily.Pretendard.thin
        case .extraLight:
            font = CFDFontFamily.Pretendard.extraLight
        case .light:
            font = CFDFontFamily.Pretendard.light
        case .regular:
            font = CFDFontFamily.Pretendard.light
        case .medium:
            font = CFDFontFamily.Pretendard.medium
        case .semiBold:
            font = CFDFontFamily.Pretendard.semiBold
        case .bold:
            font = CFDFontFamily.Pretendard.bold
        case .extraBold:
            font = CFDFontFamily.Pretendard.extraBold
        case .black:
            font = CFDFontFamily.Pretendard.black
        }
        
        return font.swiftUIFont(size: size)
    }
    
    static func rixanuai(size: CGFloat) -> Font {
        return CFDFontFamily.RixInooAriDuriPro.regular.swiftUIFont(size: size)
    }
    
    
}
