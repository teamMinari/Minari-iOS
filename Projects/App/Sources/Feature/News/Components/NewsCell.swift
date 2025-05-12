import SwiftUI

struct NewsCell: View {
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: "https://www.techsmith.com/blog/wp-content/uploads/2023/08/What-are-High-Resolution-Images.png")) { result in
                result.image?
                    .resizable()
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(.rect(topLeadingRadius: 16, topTrailingRadius: 16))
            
            
            VStack(alignment: .leading, spacing: 12) {
                Text("난 왜 학교에? 아이들 폭동 일으켜(대구 소프트 웨...")
                    .font(.pretendard(size: 18, weight: .semibold))
                    .lineLimit(2)
                    .foregroundStyle(CFDAsset.Gray.g800.swiftUIColor)
                
                HStack(spacing: 4) {
                    Text("24.7.25")
                    
                    Circle()
                        .frame(width: 2, height: 2)
                    
                    Text("1시간 전")
                }
                .font(.pretendard(size: 14))
                .foregroundStyle(CFDAsset.Gray.g400.swiftUIColor)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .padding(.bottom, 2)
            .background(Color.white.clipShape(.rect(bottomLeadingRadius: 16, bottomTrailingRadius: 16)))
            
            
        }
        
        
    }
}
