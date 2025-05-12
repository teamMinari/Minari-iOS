import SwiftUI

struct NewsMiniCell: View {
    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: URL(string: "https://www.techsmith.com/blog/wp-content/uploads/2023/08/What-are-High-Resolution-Images.png")) { result in
                result.image?
                    .resizable()
            }
            .frame(width: 120, height: 78)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            
            VStack(alignment: .leading, spacing: 5) {
                Text("난 왜 학교에? 아이들 폭동 일으켜(대구 소프트웨어...")
                    .font(.pretendard(size: 14, weight: .semibold))
                    .lineLimit(2)
                
                HStack(spacing: 4) {
                    Text("24.7.25")
                    
                    Circle()
                        .frame(width: 2, height: 2)
                    
                    Text("1시간 전")
                }
                .font(.pretendard(size: 14))
                .foregroundStyle(CFDAsset.Gray.g400.swiftUIColor)
            }
        }
    }
}
