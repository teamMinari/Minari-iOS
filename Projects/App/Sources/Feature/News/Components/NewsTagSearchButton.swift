import SwiftUI

struct NewsTagSearchButton: View {
    
    let category: CFDCategory
    
    @Binding var isEnable: Bool
    
    init(category: CFDCategory, isEnable: Binding<Bool> = .constant(false)) {
        self.category = category
        self._isEnable = isEnable
    }
    
    var body: some View {
        VStack(spacing: 5) {
            Group {
                if isEnable {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(CFDAsset.Primary.p300.swiftUIColor)
                } else {
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(CFDAsset.Gray.g200.swiftUIColor)
                        .background(Color.white)
                }
            }
            .frame(width: 55, height: 55)
            .overlay {
                category.image
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            Text(category.name)
                .font(.pretendard(size: 14))
                .foregroundStyle(CFDAsset.Gray.g700.swiftUIColor)
        }
    }
}
