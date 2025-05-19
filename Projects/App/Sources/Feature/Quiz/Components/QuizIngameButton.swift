import SwiftUI

struct QuizIngameButton: View {
    
    let type: QuizIngameButtonType
    let isEnabled: Bool
    let action: () -> ()
    
    init(_ type: QuizIngameButtonType, isEnabled: Bool, action: @escaping () -> Void) {
        self.type = type
        self.isEnabled = isEnabled
        self.action = action
    }
    
    var body: some View {
        Button {
          action() 
        } label: {
            VStack {
                type.image
                    .resizable()
                    .frame(width: 90, height: 98)
                    .grayscale(isEnabled ? 0.0 : 1.0)
                
                
                Text(type.text)
                    .font(.pretendard(size: 18, weight: .semibold))
                    .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 45)
            .background(
                (
                    isEnabled
                    ? type.backgroundColor :
                        CFDAsset.Gray.g200.swiftUIColor
                ).clipShape(RoundedRectangle(cornerRadius: 16))
            )
        }
    }
}

enum QuizIngameButtonType {
    case yes, no
    
    var text: String {
        switch self {
        case .yes: "네"
        case .no: "아니오"
        }
    }
    
    var image: Image {
        switch self {
        case .yes:
            CFDAsset.Image.quizYes.swiftUIImage
        case .no:
            CFDAsset.Image.quizNo.swiftUIImage
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .yes:
            Color(hex: 0xC8E0FA)
        case .no:
            Color(hex: 0xFFD6D6)
        }
    }
}
