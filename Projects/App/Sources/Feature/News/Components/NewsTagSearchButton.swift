import SwiftUI

struct NewsTagSearchButton: View {
    
    let category: CFDCategory
    
    var isEnable: Bool
    let action: () -> ()
    
    init(category: CFDCategory, isEnable: Bool, action: @escaping () -> ()) {
        self.category = category
        self.isEnable = isEnable
        self.action = action
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
        .onTapGesture {
            action()
        }
    }
}
