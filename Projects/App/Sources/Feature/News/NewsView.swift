import SwiftUI

struct NewsView: View {
    
    let tagCategories: [CFDCategory] = [.finance, .securities, .industrialBusiness, .realEstate, .economy]

    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Spacer(minLength: 32)

                NewsCell()
                    .padding(.horizontal, 25)
                
                HStack(spacing: 4) {
                    ForEach(0..<3) { _ in
                        CFDAsset.Icon.circle.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 6, height: 6)
                            .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                        .frame(height: 30)
                    
                    Text("뉴스 태그 검색")
                        .font(.pretendard(size: 16, weight: .semibold))
                        .foregroundStyle(CFDAsset.Gray.g800.swiftUIColor)
                    
                    HStack(spacing: 0) {
                        
                        ForEach(tagCategories.dropLast(), id: \.hashValue) { item in
                            
                            NewsTagSearchButton(category: item)
                            
                            Spacer()
                            
                        }
                        
                        NewsTagSearchButton(category: tagCategories.last!, isEnable: .constant(true))

                    }
                    
                    
                    Spacer()
                        .frame(height: 24)
                    
                    NewsMiniCell()
                    
                    Spacer()
                        .frame(height: 60)

                }
                .padding(.horizontal, 22)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(CFDAsset.Gray.g50.swiftUIColor)
    }
}

#Preview {
    NewsView()
}
