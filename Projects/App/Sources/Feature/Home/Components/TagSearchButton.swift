import SwiftUI

struct TagSearchButton: View {
    let category: CFDCategory
    
    var body: some View {
        Button {
            
        } label: {
            VStack(spacing: 5) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(CFDAsset.Gray.g100.swiftUIColor, lineWidth: 1)
                    }
                    .overlay {
                        TagSearchButtonImages.get(category: category)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                
                Text(category.name)
                    .font(.pretendard(size: 12, weight: .semiBold))
                    .foregroundStyle(CFDAsset.Gray.g700.swiftUIColor)
            }
        }
    }
}
