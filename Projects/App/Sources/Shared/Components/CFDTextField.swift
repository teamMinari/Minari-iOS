import SwiftUI

struct CFDTextField: View {
    
    let prompt: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(hex: 0xF8F8F8))
            .frame(height: 48)
            .overlay {
                TextField(
                    "CFDTFKey",
                    text: .constant(""),
                    prompt: Text(prompt)
                        .font(.pretendard(size: 16, weight: .semiBold))
                        .foregroundColor(CFDAsset.Gray.g300.swiftUIColor)
                )
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .font(.pretendard(size: 16))
                .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                .padding(.horizontal, 12)
            }
            
    }
}



