import SwiftUI


struct OnboardingView: View {
    var body: some View {
        VStack {
            HStack(spacing: 7) {
                CFDAsset.Image.logoWithShadow.swiftUIImage
                    .resizable()
                    .frame(width: 21, height: 31)
                
                
                Text("청포도")
                    .font(.rixanuai(size: 30))
                    .foregroundStyle(CFDAsset.Primary.blue.swiftUIColor)
                
            }
            
            Text("청소년을 위한 포켓 경제 도우미")
            
            CFDAsset.Image.saly.swiftUIImage
                .padding(.bottom, 27)
            
            VStack {
                CFDBottomButton {
                    
                } text: {
                    Text("로그인")
                        .font(.pretendard(size: 15, weight: .bold))
                        .foregroundColor(Color.white)
                }
                
                CFDBottomButton(
                    text: {
                        Text("회원가입")
                            .font(.pretendard(size: 15, weight: .bold))
                            .foregroundColor(CFDAsset.Primary.blue.swiftUIColor)
                    },
                    background: Color.white,
                    strokeStyle: .init(lineWidth: 1),
                    strokeColor: CFDAsset.Primary.blue.swiftUIColor
                )
            }
            .padding(.horizontal, 28)
            
        }
    }
}

#Preview {
    OnboardingView()
}
