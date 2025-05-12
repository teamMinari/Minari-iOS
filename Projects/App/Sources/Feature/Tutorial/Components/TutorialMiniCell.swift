import SwiftUI

struct TutorialMiniCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("학생들에게 맞는 경제")
                .font(.pretendard(size: 20, weight: .bold))
                .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                
            
            HStack(spacing: 8) {
                CFDAsset.Icon.clock.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(Color.black)
                
                Text("27분")
                    .font(.pretendard(size: 12))
                    .foregroundStyle(Color(hex: 0x434343))
            }
            
            HStack(spacing: 6) {
                ForEach(0..<3) { _ in
                    Text("#첫 시작")
                        .font(.pretendard(size: 14))
                        .foregroundStyle(CFDAsset.Gray.g500.swiftUIColor)
                }
            }
            
            Text("학생들에게 맞춤 경제 내용을 확인하고 새로운 생각을 넓힐 수 있어요.")
                .font(.pretendard(size: 16))
                .foregroundStyle(CFDAsset.Gray.g400.swiftUIColor)
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 15)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(CFDAsset.Gray.g100.swiftUIColor)
                .background(RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                )
        )
    }
}
