import SwiftUI

struct HomeView: View {
    
    let tagCategories: [CFDCategory] = [.finance, .securities, .industrialBusiness, .realEstate, .economy]
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.white)
                .frame(height: 40)
                
            
            Rectangle()
                .fill(Color.white)
                .frame(height: 125)
                .overlay {
                    CFDSearchBar()
                        .padding(.horizontal, 24)
                }
            
            
            ScrollView {
                Spacer()
                    .frame(height: 20)
                
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("뉴스 태그 검색")
                            .font(.pretendard(size: 16, weight: .semiBold))
                            .foregroundStyle(CFDAsset.Gray.g800.swiftUIColor)
                        
                        HStack(spacing: 0) {
                            
                            ForEach(tagCategories.dropLast(), id: \.hashValue) { item in
                                
                                TagSearchButton(category: item)
                                
                                Spacer()
                                
                            }
                            
                            TagSearchButton(category: tagCategories.last ?? .economy)
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("오늘의 경제 단어")
                            .font(.pretendard(size: 16, weight: .semiBold))
                        
                        TodayTermsCard()
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(CFDAsset.Gray.g50.swiftUIColor)
        
        
    }
}
