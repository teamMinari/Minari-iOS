import SwiftUI

struct ProfileTitleCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(CFDAsset.Gray.g300.swiftUIColor)
            .background(RoundedRectangle(cornerRadius: 16).fill(CFDAsset.Gray.g100.swiftUIColor))
            .frame(height: 108)
            .overlay {
                HStack(spacing: 0) {
                    CFDAsset.Image.grape.swiftUIImage
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 0) {
                            Text("현재 칭호")
                                .font(.pretendard(size: 16, weight: .semibold))
                            
                            CFDAsset.Icon.arrowRight.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                        }
                        .foregroundStyle(CFDAsset.Primary.p300.swiftUIColor)
                        
                        Text("헤실거리는 포도송이")
                            .font(.pretendard(size: 20, weight: .bold))
                            .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                        
                        Spacer()
                            .frame(maxHeight: 8)
                        
                        InfoBubble(text: "\"히힛\"")
                    }
                }
                .padding(.horizontal, 25)
            }
    }
}
