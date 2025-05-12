import SwiftUI

struct TutorialView: View {
    var body: some View {
        ScrollView {
            VStack {
                VStack(spacing: 40) {
                    Spacer()
                        .frame(height: 32)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            CFDAsset.Icon.tutorialFill.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            
                            Text("튜토리얼")
                                .font(.pretendard(size: 24, weight: .bold))
                            
                            Spacer()
                        }
                        .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                        
                        Text("자신에게 맞는 포도송이를 획득할 수 있어요.")
                            .font(.pretendard(size: 13, weight: .medium))
                    }
                    
                    
                    HStack(spacing: 15) {
                        Circle()
                            .trim(from: 0, to: 0.75)
                            .stroke(CFDAsset.Primary.p500.swiftUIColor, style: .init(lineWidth: 4))
                            .frame(width: 70, height: 70)
                            .overlay {
                                Text("75 %")
                                    .font(.pretendard(size: 16, weight: .semibold))
                                    .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                            }
                        
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("경제의 시작")
                                .font(.pretendard(size: 18, weight: .semibold))
                            
                            Text("학습중")
                                .font(.pretendard(size: 16, weight: .semibold))
                                .foregroundStyle(CFDAsset.Primary.p400.swiftUIColor)
                            
                        }
                        
                        CFDAsset.Image.bookFriends.swiftUIImage
                    }
                    
                    
                    Spacer()
                        .frame(height: 40)
                    
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity)
                .background {
                    VStack(spacing: 0) {
                        Color.white
                        
                        CFDAsset.Image.tutorialBackground.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .background(Color.white)
                            .clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
                    }
                    
                    
                }
                .overlay {
                    GeometryReader { reader in
                        
                        
                        RoundedRectangle(cornerRadius: 30)
                            .fill(LinearGradient(colors: [Color(hex: 0x363CD5), Color(hex: 0x701BDD)], startPoint: .top, endPoint: .bottomTrailing))
                            .frame(height: 55)
                            .padding(.horizontal, 44)
                        
                            .overlay {
                                HStack(spacing: 5) {
                                    CFDAsset.Icon.clipboard.swiftUIImage
                                    
                                    Text("맞춤 학습 조회")
                                        .font(.pretendard(size: 20, weight: .bold))
                                }
                                .foregroundStyle(Color.white)
                                
                                
                            }
                            .position(x: reader.frame(in: .local).width / 2, y: reader.frame(in: .local).height)
                        
                    }
                    
                }
                
                Spacer()
                    .frame(height: 48)
                
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("고등학생 추천 포도송이")
                            .font(.pretendard(size: 16, weight: .semibold))
                            .foregroundStyle(Color.black)
                        
                        TutorialCell()
                        
                    }
                    
                    HStack(spacing: 4) {
                        ForEach(0..<3) { _ in
                            CFDAsset.Icon.circle.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 6, height: 6)
                                .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("최신 포도송이")
                            .font(.pretendard(size: 16, weight: .semibold))
                            .foregroundStyle(Color.black)
                        
                        TutorialMiniCell()
                   
                        
                    }
                }
                .padding(.horizontal, 24)
                
                
                Spacer()
                    .frame(height: 120)
            }
        }
        .ignoresSafeArea()

        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(CFDAsset.Gray.g50.swiftUIColor)
    }
}

#Preview {
    TutorialView()
}
