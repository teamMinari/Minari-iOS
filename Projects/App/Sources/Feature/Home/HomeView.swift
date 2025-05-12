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
                    HStack(spacing: 12) {
                        CFDAsset.Icon.logo.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                            .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                        
                        CFDSearchBar()
                    }
                    .padding(.horizontal, 24)
                }
            
            
            ScrollView {
                Spacer()
                    .frame(height: 20)
                
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("뉴스 태그 검색")
                            .font(.pretendard(size: 16, weight: .semibold))
                            .foregroundStyle(CFDAsset.Gray.g800.swiftUIColor)
                        
                        HStack(spacing: 0) {
                            
                            ForEach(tagCategories.dropLast(), id: \.hashValue) { item in
                                
                                TagSearchButton(category: item)
                                
                                Spacer()
                                
                            }
                            
                            TagSearchButton(category: tagCategories.last ?? .economy)
                            
                        }
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("오늘의 경제 단어")
                            .font(.pretendard(size: 16, weight: .semibold))
                        
                        TodayTermsCard()
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("지금 뜨는 뉴스")
                            .font(.pretendard(size: 16, weight: .semibold))
                        
                        VStack(spacing: 20) {
                            TodayNewsCard()
                            
                            TodayNewsCard()
                            
                            TodayNewsCard()
                        }

                        
                    }
                    
                    Button {
                        
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
                
                Spacer(minLength: 120)

            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(CFDAsset.Gray.g50.swiftUIColor)
       
        
        
    }
}
