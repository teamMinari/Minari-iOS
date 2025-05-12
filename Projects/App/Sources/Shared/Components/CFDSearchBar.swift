import SwiftUI

struct CFDSearchBar: View {
    
    @FocusState var isFocused: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(height: 48)
            .foregroundStyle(CFDAsset.Gray.gDefault.swiftUIColor)
            .onTapGesture {
                isFocused = true
            }
            .overlay {
                HStack {
                    TextField(text: .constant("")) {
                        Text("검색")
                            .font(.pretendard(size: 16, weight: .semibold))
                            .foregroundStyle(CFDAsset.Gray.g300.swiftUIColor)
                    }
                    .focused($isFocused)
                    
                    Button {
                        
                    } label: {
                        CFDAsset.Icon.search.swiftUIImage
                            .tint(CFDAsset.Gray.g500.swiftUIColor)
                    }
                    
                }
                .padding(.horizontal, 12)

            }
            
    }
}
