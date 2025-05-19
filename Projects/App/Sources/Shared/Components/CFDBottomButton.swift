import SwiftUI

struct CFDBottomButton<Content: View, S: ShapeStyle>: View {
    let action: (() -> ())?
    let content: Content
    let background: S
    let stroke: StrokeStyle?
    let strokeColor: Color?
    
    init(
        action: (() -> ())? = nil,
        content: () -> Content,
        background: S = CFDAsset.Primary.p500.swiftUIColor,
        strokeStyle: StrokeStyle? = nil,
        strokeColor: Color? = nil
    ) {
        self.content = content()
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
            
            RoundedRectangle(cornerRadius: 12)
                .fill(background)
                .overlay {
                    if let stroke = stroke,
                       let strokeColor = strokeColor {
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(strokeColor, style: stroke)
                    }
                }
        }
        .frame(height: 44)
        .overlay {
            content
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
