import SwiftUI


struct InfoBubble: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.pretendard(size: 12, weight: .semibold))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background (
                InfoBubbleShape()
                    .stroke(CFDAsset.Gray.g200.swiftUIColor, style: .init(lineWidth: 1))
                    .background(InfoBubbleShape().fill(Color.white))
            )
    }
}

struct InfoBubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topLeft, .topRight, .bottomRight],
            cornerRadii: .init(width: 16, height: 16)
        )
        
        return Path(path.cgPath)
            
        
    }
    
    
}
