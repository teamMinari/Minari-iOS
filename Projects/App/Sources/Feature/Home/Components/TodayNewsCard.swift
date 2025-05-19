import SwiftUI
import Kingfisher

struct TodayNewsCard: View {
    
    let item: NewsResponse
    
    var body: some View {
        VStack(spacing: 0) {
            KFImage(URL(string: item.thumbnail ?? ""))
                .placeholder {
                    CFDAsset.Gray.g100.swiftUIColor
                }
                .resizable()
                .frame(height: 140)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(.rect(topLeadingRadius: 16, topTrailingRadius: 16))
            
            
            VStack(alignment: .leading, spacing: 12) {
                Text(item.title)
                    .font(.pretendard(size: 14, weight: .semibold))
                    .lineLimit(2)
                    .foregroundStyle(CFDAsset.Gray.g800.swiftUIColor)
                
                Text(item.company ?? "출처 없음")
                    .font(.pretendard(size: 12))
                    .foregroundStyle(CFDAsset.Gray.g600.swiftUIColor)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .padding(.bottom, 2)
            .background(Color.white.clipShape(.rect(bottomLeadingRadius: 16, bottomTrailingRadius: 16)))
            
            
        }
        .onTapGesture {
            if let url = item.url {
                NavigationManager.instance.present(next: SafariViewer(url: url))
            }
    
        }
        
        
    }
}
