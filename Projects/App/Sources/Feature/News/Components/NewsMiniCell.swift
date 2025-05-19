import SwiftUI
import Kingfisher

struct NewsMiniCell: View {
    let item: NewsResponse
    
    let dateFormatter = DateFormatter()
    
    init(item: NewsResponse) {
        self.item = item
        
        dateFormatter.dateFormat = "yy.M.dd"
    }
    var body: some View {
        HStack(spacing: 10) {
            KFImage(URL(string: item.thumbnail ?? ""))
                .placeholder {
                    CFDAsset.Gray.g100.swiftUIColor
                }
                .resizable()
                .frame(width: 120, height: 78)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.title)
                    .font(.pretendard(size: 14, weight: .semibold))
                    .lineLimit(2)
                
                HStack(spacing: 4) {
                    Text(dateFormatter.string(from: Date.now))
                    
                    Circle()
                        .frame(width: 2, height: 2)
                    
                    Text(item.uploadTime ?? "지금")
                }
                .font(.pretendard(size: 14))
                .foregroundStyle(CFDAsset.Gray.g400.swiftUIColor)
            }
        }
    }
}
