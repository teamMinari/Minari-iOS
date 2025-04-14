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
                    TextField(text: .constant("Search")) {
                        Text("검색")
                    }
                    .focused($isFocused)
                    
                    Button {
                        
                    } label: {
                        CFDAsset.Icon.search.swiftUIImage
                    }
                    
                }
                .padding(.horizontal, 12)

            }
            
    }
}
