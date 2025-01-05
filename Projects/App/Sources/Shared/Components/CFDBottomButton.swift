import SwiftUI

struct CFDBottomButton: View {
    let action: (() -> ())?
    let text: Text
    let background: Color
    let stroke: StrokeStyle?
    let strokeColor: Color?
    
    init(
        action: (() -> ())? = nil,
        text: () -> Text,
        background: Color = CFDAsset.Primary.blue.swiftUIColor,
        strokeStyle: StrokeStyle? = nil,
        strokeColor: Color? = nil
    ) {
        self.text = text()
        self.background = background
        self.action = action
        self.stroke = strokeStyle
        self.strokeColor = strokeColor
    }
    
    public var body: some View {
        Button {
            if let action = action {
                action()
            }
        } label: {
            Group {
                if let stroke = stroke,
                   let strokeColor = strokeColor {
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(strokeColor, style: stroke)
                        .background(RoundedRectangle(cornerRadius: 30).fill(background))
                } else {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(background)
                }
            }
            .frame(height: 45)
            .overlay {
                text
            }
            
        }
        
    }
}

#Preview {
    CFDBottomButton{
        Text("로그인")
            .font(.pretendard(size: 15, weight: .bold))
            .foregroundColor(Color.black)
    }
    .padding(.horizontal, 28)
}
