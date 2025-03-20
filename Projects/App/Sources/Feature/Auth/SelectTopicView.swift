import SwiftUI

struct SelectTopicView: View {
    var body: some View {
        VStack(spacing: 4) {
            Spacer()
                .frame(maxHeight: 70)
            
            VStack(alignment: .leading) {
                
                Text("어떤 주제에 관심이\n있으신가요?")
                    .font(.pretendard(size: 25, weight: .bold))
                
                HStack {
                    Spacer()
                }
                Spacer()
            }
            
            Text("관심주제는 나중에 다시 수정할 수 있어요")
                .font(.pretendard(size: 13))
                .foregroundStyle(CFDAsset.Gray.default.swiftUIColor)
            
            CFDBottomButton {
                Text("다음")
                    .font(.pretendard(size: 15, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Spacer()
                .frame(maxHeight: 100)
        }
        .padding(.horizontal, 28)
    }
}

#Preview {
    SelectTopicView()
}
