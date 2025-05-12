import SwiftUI

struct TodayTermsCard: View {
    var body: some View {
        
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.white)
            .frame(height: 116)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(CFDAsset.Gray.g100.swiftUIColor, lineWidth: 1)
            }
            .overlay {
                VStack(alignment: .leading) {
                    HStack(spacing: 8) {
                        Text("가산금리")
                            .font(.pretendard(size: 18, weight: .semibold))
                        
                        HStack(spacing: -4) {
                            ForEach(0..<2) { _ in
                                CFDAsset.Icon.starFill.swiftUIImage
                                    .foregroundStyle(CFDAsset.Primary.p200.swiftUIColor)
                                    
                            }
                        }
                        
                    }
                    
                    HStack(spacing: 8) {
                        Text("금융 기관에서 대출, 채권 따위의 금리를 결정할 때 기준 금리에 덧붙이는 금리.")
                            .font(.pretendard(size: 14, weight: .semibold))
                            .foregroundStyle(CFDAsset.Gray.g500.swiftUIColor)
                            .lineLimit(1)
                        
                        Button {
                            
                        } label: {
                            Text("더보기")
                                .font(.pretendard(size: 12))
                                .foregroundStyle(CFDAsset.Gray.g400.swiftUIColor)
                        }
                        
                    }
                    
                    Spacer()
                        .frame(maxHeight: 20)
                    
                    HStack(spacing: 4) {
                        Spacer()
                        
                        ForEach(0..<3) { _ in
                            CFDAsset.Icon.circle.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 6, height: 6)
                                .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                        }
                        
                        Spacer()
                    }
                        
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                
               
            }
    }
    
}
