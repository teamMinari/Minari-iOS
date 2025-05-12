
import SwiftUI

struct SelectTopicButton: View {
    
    
    let text: String
    @Binding var isSelected: Bool
    
    init(_ text: String = "10대", isSelected: Binding<Bool>) {
        self._isSelected = isSelected
        self.text = text
    }
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            Text(text)
                .font(.pretendard(size: 12, weight: .semibold))
                .foregroundColor(isSelected ? Color.white : CFDAsset.Gray.g500.swiftUIColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 6)
                .background(
                    Group {
                        if (isSelected) {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(CFDAsset.Primary.p500.swiftUIColor)
                        }
                        else {
                            RoundedRectangle(cornerRadius: 12)
                                .strokeBorder(CFDAsset.Gray.g200.swiftUIColor)
                        }
                    }
                        
                )
        }
    }
}


#Preview {

    SelectTopicButton(isSelected: .constant(true))
    
}
