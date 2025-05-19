import SwiftUI

struct ProfileTitleCard: View {
    let item: ProfileResponse?
    
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
                        
                        Text(item?.title ?? "칭호가 없습니다")
                            .font(.pretendard(size: 20, weight: .bold))
                            .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                        
                        Spacer()
                            .frame(maxHeight: 8)
                        
                        InfoBubble(text: "\"히힛\"")
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.horizontal, 25)
            }
        
    }
}
