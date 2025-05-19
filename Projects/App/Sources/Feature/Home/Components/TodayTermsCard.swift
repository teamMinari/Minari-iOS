import SwiftUI

struct TodayTermsCard: View {
    
    let terms: [TermsResponse]
    @Binding var selectedIndex: Int
    let action: () -> ()
    
    init(terms: [TermsResponse], selectedIndex: Binding<Int>, action: @escaping () -> Void) {
        self.terms = terms
        self._selectedIndex = selectedIndex
        self.action = action
    }
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(0..<terms.count, id: \.self) { index in
                let item = terms[index]
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(CFDAsset.Gray.g100.swiftUIColor, lineWidth: 1)
                    }
                    .overlay {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 8) {
                                Text(item.termNm)
                                    .font(.pretendard(size: 18, weight: .semibold))
                                
                                HStack(spacing: -4) {
                                    ForEach(0..<(Int(item.termDifficulty.replacingOccurrences(of: "LV_", with: "")) ?? 1), id: \.self) { _ in
                                        CFDAsset.Icon.starFill.swiftUIImage
                                            .foregroundStyle(CFDAsset.Primary.p200.swiftUIColor)
                                        
                                    }
                                }
                                
                            }
                            
                            HStack(spacing: 8) {
                                Text(item.termExplain)
                                    .font(.pretendard(size: 14, weight: .semibold))
                                    .foregroundStyle(CFDAsset.Gray.g500.swiftUIColor)
                                    .lineLimit(1)
                                
                                Button {
                                    action()
                                } label: {
                                    Text("더보기")
                                        .font(.pretendard(size: 12))
                                        .foregroundStyle(CFDAsset.Gray.g400.swiftUIColor)
                                }
                                
                            }
                            
                            Spacer()
                            
                        }
                        .onTapGesture {
                            action()
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                        
                        
                    }
                
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 116)
        .overlay {
            VStack {
                Spacer()
                
                HStack(spacing: 4) {
                    Spacer()
                    
                    ForEach(0..<terms.count, id: \.self) { i in
                        CFDAsset.Icon.circle.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 6, height: 6)
                            .foregroundStyle(i == selectedIndex ? CFDAsset.Primary.p500.swiftUIColor : CFDAsset.Gray.g200.swiftUIColor)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 16)
            }
        }
        
    }
    
}
