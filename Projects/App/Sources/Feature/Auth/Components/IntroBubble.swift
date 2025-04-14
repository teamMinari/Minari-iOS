import SwiftUI

struct IntroBubble<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(.vertical, 13)
            .padding(.horizontal, 20)
            .background {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, bottomLeading: 15, topTrailing: 15))
                    .fill(Color.white)
                    .overlay {
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, bottomLeading: 15, topTrailing: 15))
                            .strokeBorder(Color(hex: 0xEDECEB), lineWidth: 1.5)

                    }
            }
        
            
    }
}
