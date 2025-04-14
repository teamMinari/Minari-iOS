import SwiftUI

struct TodayTermsCard: View {
    var body: some View {
        
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.white)
            .frame(height: 116)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(CFDAsset.Gray.g100.swiftUIColor, lineWidth: 1)
            }
            .overlay {
                VStack {
                    Text("가산금리")
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                
            }
    }
    
}
