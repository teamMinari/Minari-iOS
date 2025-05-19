import SwiftUI

struct NewsView: View {
    
    let tagCategories: [CFDCategory] = [.finance, .securities, .industrialBusiness, .realEstate, .economy]
    
    @EnvironmentObject var _newsVM: NewsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Spacer(minLength: 32)
                
                NewsCell(items: _newsVM.hotNewsList, selectedIndex: $_newsVM.selectedIndex)
                    .padding(.horizontal, 25)
                
                
                HStack(spacing: 4) {
                    
                    ForEach(0..<_newsVM.hotNewsList.count, id: \.self) { i in
                        CFDAsset.Icon.circle.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 6, height: 6)
                            .foregroundStyle(i == _newsVM.selectedIndex ? CFDAsset.Primary.p500.swiftUIColor : CFDAsset.Gray.g200.swiftUIColor)
                    }
                    
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                        .frame(height: 30)
                    
                    Text("뉴스 태그 검색")
                        .font(.pretendard(size: 16, weight: .semibold))
                        .foregroundStyle(CFDAsset.Gray.g800.swiftUIColor)
                    
                    HStack(alignment: .top, spacing: 0) {
                        
                        Spacer()
                        
                        ForEach(tagCategories, id: \.self) { item in
                            NewsTagSearchButton(category: item, isEnable: (item == _newsVM.currentCategory)) {
                                _newsVM.currentCategory = item
                            }
                            
                            Spacer()
                            
                        }
                        
                    }
                    
                    
                    Spacer()
                        .frame(height: 24)
                    
                    ForEach(_newsVM.newsList, id: \.self) { item in
                        NewsMiniCell(item: item)
                    }
                    
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
        .onAppear {
            if _newsVM.hotNewsList.isEmpty {
                _newsVM.fetchHotnews()
            }
            
            if _newsVM.newsList.isEmpty {
                _newsVM.fetchNews()
            }
        }
        .onChange(of: _newsVM.currentCategory) { value in
            _newsVM.fetchNews()
        }
    }
}

#Preview {
    NewsView()
}
