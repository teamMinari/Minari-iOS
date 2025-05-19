
import SwiftUI

struct SelectTopicButton: View {
    
    
    var text: String
    var isSelected: Bool
    
    let action: () -> ()
    
    init(_ text: String = "10대", isSelected: Bool, action: @escaping () -> ()) {
        self.isSelected = isSelected
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
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

    SelectTopicButton(isSelected: true) {
        
    }
    
}
