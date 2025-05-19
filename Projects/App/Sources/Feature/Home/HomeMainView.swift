import SwiftUI

struct HomeMainView: View {
    
    let tagCategories: [CFDCategory] = [.finance, .securities, .industrialBusiness, .realEstate, .economy]
    
    @EnvironmentObject var _homeVM: HomeViewModel

    @EnvironmentObject var _rootVM: RootViewModel
    @EnvironmentObject var _newsVM: NewsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
                .frame(height: 20)
            
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("뉴스 태그 검색")
                        .font(.pretendard(size: 16, weight: .semibold))
                        .foregroundStyle(CFDAsset.Gray.g800.swiftUIColor)
                    
                    HStack(spacing: 0) {
                        
                        Spacer()
                        
                        ForEach(tagCategories, id: \.hashValue) { item in
                            
                            TagSearchButton(category: item) {
                                _newsVM.currentCategory = item
                                _rootVM.tabSelection = .news
                            }
                            
                            Spacer()
                            
                        }
                        
                        
                    }
                }
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("오늘의 경제 단어")
                        .font(.pretendard(size: 16, weight: .semibold))
                    
                    TodayTermsCard(terms: _homeVM.todayTermResponses ?? .init(), selectedIndex: $_homeVM.todayTermIndex) {
                        _homeVM.keywordRequest.keyword = _homeVM.todayTermResponses?[_homeVM.todayTermIndex].termNm ?? ""
                        
                        _homeVM.searchKeyword {
                            
                        }
                    }
                    .skeleton(_homeVM.todayTermResponses == nil, shape: RoundedRectangle(cornerRadius: 16))
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("지금 뜨는 뉴스")
                        .font(.pretendard(size: 16, weight: .semibold))
                    
                    VStack(spacing: 20) {
                        if _newsVM.hotNewsList.isEmpty {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(CFDAsset.Gray.g100.swiftUIColor)
                                .frame(height: 220)
                            
                        } else {
                            ForEach(_newsVM.hotNewsList, id: \.hashValue) { item in
                                TodayNewsCard(item: item)
                            }
                        }
                    }
                        
                    
                    
                }
                
                Button {
                    _rootVM.tabSelection = .news
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(CFDAsset.Gray.g200.swiftUIColor)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
                        .frame(height: 44)
                        .overlay {
                            HStack {
                                Spacer()
                                
                                CFDAsset.Icon.starFill.swiftUIImage
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                
                                
                                Text("많이 본 뉴스 더보기")
                                    .font(.pretendard(size: 16, weight: .semibold))
                                
                                Spacer()
                                
                            }
                            .foregroundStyle(CFDAsset.Gray.g500.swiftUIColor)
                            
                        }
                }
            }
            .padding(.horizontal, 20)
            
            
        }
    }
}
