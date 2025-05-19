import SwiftUI
import Kingfisher

struct HomeSearchView: View {
    
    @EnvironmentObject var _homeVM: HomeViewModel
    
    
    var body: some View {
        VStack(spacing: 5) {
            VStack(spacing: 14) {
                HStack {
                    if let difficulty = _homeVM.keywordItem?.termDifficulty {
                        
                        HStack(spacing: -2) {
                            ForEach(0 ..< (Int(difficulty.replacingOccurrences(of: "LV_", with: "")) ?? 1), id: \.self) { _ in
                                CFDAsset.Icon.starFill.swiftUIImage
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(CFDAsset.Primary.p200.swiftUIColor)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        CFDAsset.Icon.banner.swiftUIImage
                            .tint(CFDAsset.Gray.g600.swiftUIColor)
                    }
                    
                }
                
                HStack {
                    Text(_homeVM.keywordItem?.termNm ?? "없음")
                        .font(.pretendard(size: 28, weight: .bold))
                        .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                        .skeleton(_homeVM.keywordItem == nil, shape: Rectangle())
                    
                    Spacer()
                }
                
                Rectangle()
                    .fill(CFDAsset.Gray.g100.swiftUIColor)
                    .frame(height: 2)
                
                Text(_homeVM.keywordItem?.termExplain ?? "없음")
                    .font(.pretendard(size: 16, weight: .medium))
                    .foregroundStyle(_homeVM.isMoreExplain ? CFDAsset.Gray.g900.swiftUIColor : CFDAsset.Gray.g700.swiftUIColor)
                    .lineLimit(_homeVM.isMoreExplain ? nil : 7)
                    .onTapGesture {
                        if(_homeVM.isMoreExplain) {
                            _homeVM.isMoreExplain = false
                        }
                    }
                    .skeleton(_homeVM.keywordItem == nil, shape: Rectangle())
                
                if (!_homeVM.isMoreExplain && _homeVM.keywordItem != nil) {
                    Button {
                        _homeVM.isMoreExplain = true
                    } label: {
                        HStack {
                            Spacer()
                            
                            Text("더보기")
                                .font(.pretendard(size: 14, weight: .semibold))
                                .foregroundStyle(CFDAsset.Gray.g500.swiftUIColor)
                            
                            Spacer()
                        }
                    }
                }
                
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 24)
            .background(Color.white)
            
            VStack {
                Button {
                    _homeVM.reviewByAI(term: _homeVM.keywordItem?.termNm ?? "")
                } label: {
                    HStack(spacing: 2) {
                        CFDAsset.Icon.aiReview.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                        
                        Text("AI 쉬운용어 풀이")
                            .font(.pretendard(size: 16, weight: .semibold))
                    }
                    .tint(CFDAsset.Primary.p900.swiftUIColor)
                }
                .disabled(_homeVM.reviewRemaining)
                .skeleton(_homeVM.keywordItem == nil, shape: Rectangle())
                
                if _homeVM.reviewRemaining {
                    if let text = _homeVM.reviewText {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("📌 \(_homeVM.keywordItem?.termNm ?? "")이 뭐야?")
                                .font(.pretendard(size: 16, weight: .semibold))
                            
                            Text(text)
                                .font(.pretendard(size: 16, weight: .medium))
                                .multilineTextAlignment(.leading)
                        }
                        .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                        .frame(maxWidth: .infinity)
                        
                    } else {
                        KFAnimatedImage(URL(fileURLWithPath: Bundle.main.path(forResource: "SearchLoading", ofType: "gif") ?? ""))
                            .cacheOriginalImage()
                            .frame(width: 140, height: 128)
                    }
                }
            }
            .padding(.vertical, 28)
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            
            
        }
        .opacity(_homeVM.isBlankContent ? 0.0 : 1.0)
        .overlay {
            if _homeVM.isBlankContent {
                GeometryReader { reader in
                    VStack(spacing: 30) {
                        
                        CFDAsset.Icon.clipboardCross.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        
                        
                        Text("해당 검색어를 찾을 수 없습니다")
                            .font(.pretendard(size: 28, weight: .bold))
                        
                    }
                    .foregroundStyle(CFDAsset.Gray.g300.swiftUIColor)
                    .position(x: reader.frame(in: .local).width / 2, y: reader.frame(in: .local).height)
                }
                
            }
            
        }
        .onDisappear {
            _homeVM.reviewText = nil
            _homeVM.reviewRemaining = false
            
        }
        
    }
}
