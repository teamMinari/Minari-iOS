import SwiftUI

struct ChatBubble: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.pretendard(size: 14))
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background (
                ChatBubbleShape()
                    .stroke(CFDAsset.Gray.g200.swiftUIColor, style: .init(lineWidth: 1))
                    .background(ChatBubbleShape().fill(Color.white))
            )
            
    }
}


struct ChatBubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topLeft, .topRight, .bottomLeft],
            cornerRadii: .init(width: 16, height: 16)
        )
        
        return Path(path.cgPath)
            
        
    }
    
    
}
