import SwiftUI

struct CFDSearchBar: View {
    
    @FocusState.Binding var isFocused: Bool
    
    @Binding var text: String
    
    let onSubmit: () -> ()
    
    init(isFocused: FocusState<Bool>.Binding, text: Binding<String> = .constant(""), onSubmit: @escaping () -> Void) {
        self._isFocused = isFocused
        self._text = text
        self.onSubmit = onSubmit
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(height: 48)
            .foregroundStyle(CFDAsset.Gray.gDefault.swiftUIColor)
            .overlay {
                HStack {
                    TextField(text: $text) {
                        Text(isFocused ? "검색어를 입력해주세요!" : "검색")
                            .font(.pretendard(size: 16, weight: .semibold))
                            .foregroundStyle(CFDAsset.Gray.g300.swiftUIColor)
                    }
                    .focused($isFocused)
                    .font(.pretendard(size: 16, weight: .semibold))
                    .foregroundStyle(CFDAsset.Gray.g700.swiftUIColor)
                    .onSubmit {
                        onSubmit()
                    }
                    
                    Button {
                        isFocused = false
                        onSubmit()
                    } label: {
                        CFDAsset.Icon.search.swiftUIImage
                            .tint(CFDAsset.Gray.g500.swiftUIColor)
                    }
                    
                }
                .padding(.horizontal, 12)

            }
            
    }
}
