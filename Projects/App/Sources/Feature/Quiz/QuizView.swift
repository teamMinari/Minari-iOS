import SwiftUI

struct QuizView: View {
    
    @EnvironmentObject var _profileVM: ProfileViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    
                    Spacer(minLength: 32)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("학습 퀴즈")
                            .font(.pretendard(size: 16, weight: .semibold))
                            .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                        
                        VStack {
                            QuizButton(.economy)
                            
                            QuizButton(.review)
                        }
                        
                        HStack {
                            Button {
                                
                            } label: {
                                HStack(spacing: 2) {
                                    CFDAsset.Icon.star.swiftUIImage
                                    
                                    Text("칭호보기")
                                        .font(.pretendard(size: 14, weight: .semibold))
                                }
                                .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                            }
                            
                            Button {
                                
                            } label: {
                                HStack(spacing: 2) {
                                    CFDAsset.Icon.call.swiftUIImage
                                    
                                    Text("문의하기")
                                        .font(.pretendard(size: 14, weight: .semibold))
                                    
                                }
                                .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                                
                            }
                        }
                        
                    }
                    .padding(.horizontal, 24)
                    
                    Spacer(minLength: 32)
                    
                    QuizTrimBackground()
                        .overlay {
                            VStack() {
                                HStack {
                                    Spacer()
                                    
                                    CFDAsset.Image.farmer.swiftUIImage
                                        .background {
                                            ZStack {
                                                Circle()
                                                    .trim(from: 0, to: 0.7)
                                                    .stroke(Color(hex: 0x28A745), style: .init(lineWidth: 5))
                                                    .frame(width: 110, height: 110)
                                                
                                                Circle()
                                                    .fill(CFDAsset.Gray.g100.swiftUIColor)
                                                    .frame(width: 95, height: 95)
                                                
                                            }
                                        }
                                    
                                    Spacer(minLength: 15)
                                    
                                    VStack(alignment: .leading) {
                                        Group {
                                            Text("\"슬기로운 포도알\"")
                                                .fontWeight(.semibold)
                                            +
                                            Text("을 얻기까지\n")
                                            +
                                            Text("100exp")
                                                .fontWeight(.semibold)
                                            +
                                            Text("가 남았습니다!")
                                        }
                                        .font(.pretendard(size: 16))
                                        
                                        
                                        InfoBubble(text: "\"나는 농사짓는 포도알이야~\"")
                                    }
                                    
                                    Spacer()
                                }
                                
                                Spacer()
                                    .frame(maxHeight: 32)
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: 0xECEFFB))
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color(hex: 0xF5F6FA)))
                                    .frame(height: 125)
                                    .overlay {
                                        ZStack(alignment: .trailing) {
                                            CFDAsset.Icon.basket.swiftUIImage
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 150, height: 150)
                                                .foregroundStyle(CFDAsset.Gray.g200.swiftUIColor)
                                                .offset(y: 14)
                                            
                                            HStack {
                                                VStack(alignment: .leading, spacing: 10) {
                                                    
                                                    Text("2,584 P")
                                                        .font(.pretendard(size: 32, weight: .bold))
                                                    
                                                    Button {
                                                        
                                                    } label: {
                                                        Text("소비하러가기>")
                                                            .font(.pretendard(size: 16, weight: .semibold))
                                                            .tint(CFDAsset.Primary.p400.swiftUIColor)
                                                    }
                                                    
                                                }
                                                
                                                Spacer()
                                            }
                                            .padding(.horizontal, 26)
                                        }
                                        
                                        
                                    }
                                
                                
                            }
                            .padding(.horizontal, 24)
                        }
                    
                    
                }
                
                
                
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(CFDAsset.Gray.g50.swiftUIColor)
        .onAppear {
            if _profileVM.response == nil {
                _profileVM.getProfile()
            }
        }
        
    }
}
