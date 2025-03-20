import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("환영합니다!🔥")
                .font(.pretendard(size: 30, weight: .bold))
            
            Spacer()
                .frame(maxHeight: 22)
            
            Text("이제부터 청For도와 함께\n경제 용어를 배워가요.")
                .font(.pretendard(size: 20, weight: .medium))
                .foregroundStyle(CFDAsset.Primary.blue.swiftUIColor)
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(maxHeight: 48)
            
            CFDAsset.Image.logoWithShadow.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 138)
            
            Spacer()
                .frame(maxHeight: 180)
            
            CFDBottomButton {
                Text("시작하기")
                    .font(.pretendard(size: 15, weight: .bold))
                    .foregroundColor(.white )
            }
            
            Spacer()
                .frame(maxHeight: 170)
        }
        .padding(.horizontal, 28)
    }
}

#Preview {
    WelcomeView()
}
