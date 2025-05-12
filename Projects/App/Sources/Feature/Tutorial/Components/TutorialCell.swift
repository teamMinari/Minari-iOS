import SwiftUI

struct TutorialCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text("학생들에게 맞는 경제")
                .font(.pretendard(size: 24, weight: .bold))
                .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
            
            HStack(spacing: 8) {
                CFDAsset.Icon.clock.swiftUIImage
                    .foregroundStyle(Color.black)
                
                Text("27분")
                    .font(.pretendard(size: 14))
                    .foregroundStyle(CFDAsset.Gray.g600.swiftUIColor)
            }
            
            HStack {
                Spacer()
                
                CFDAsset.Image.celebrate.swiftUIImage
                    
            }
            
            HStack(spacing: 6) {
                ForEach(0..<3) { _ in
                    Text("#첫 시작")
                        .font(.pretendard(size: 14, weight: .semibold))
                        .foregroundStyle(CFDAsset.Primary.p300.swiftUIColor)
                }
            }
            
            Text("학생들에게 맞춤 경제 내용을 확인하고 새로운 생각을 넓힐 수 있어요.")
                .font(.pretendard(size: 16, weight: .medium))
                .foregroundStyle(CFDAsset.Gray.g400.swiftUIColor)
        }
        .frame(maxWidth: .infinity)
        .padding(25)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(CFDAsset.Gray.g100.swiftUIColor)
                .background(RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                )
        )
    }
}
