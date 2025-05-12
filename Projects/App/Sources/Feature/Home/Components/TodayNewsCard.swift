import SwiftUI

struct TodayNewsCard: View {
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: "https://www.techsmith.com/blog/wp-content/uploads/2023/08/What-are-High-Resolution-Images.png")) { result in
                result.image?
                    .resizable()
            }
            .frame(height: 140)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(.rect(topLeadingRadius: 16, topTrailingRadius: 16))
            
            
            VStack(alignment: .leading, spacing: 12) {
                Text("코스닥 새내기株 대진첨단소재 85% 강세…장중 '따블'[핫종목]")
                    .font(.pretendard(size: 14, weight: .semibold))
                    .lineLimit(2)
                    .foregroundStyle(CFDAsset.Gray.g800.swiftUIColor)
                
                Text("뉴스원")
                    .font(.pretendard(size: 12))
                    .foregroundStyle(CFDAsset.Gray.g600.swiftUIColor)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .padding(.bottom, 2)
            .background(Color.white.clipShape(.rect(bottomLeadingRadius: 16, bottomTrailingRadius: 16)))
            
            
        }
        
        
    }
}
