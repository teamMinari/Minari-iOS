import SwiftUI


struct CFDTextField: View {
    
    
    let prompt: String
    @Binding var text: String
    var isSecure: Bool
    
    init(prompt: String, text: Binding<String> = .constant(""), isSecure: Bool = false) {
        self.prompt = prompt
        self._text = text
        self.isSecure = isSecure
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(hex: 0xF8F8F8))
            .frame(height: 48)
            .overlay {
                Group {
                    if !isSecure {
                        TextField(
                            "CFDTFKey",
                            text: $text,
                            prompt: Text(prompt)
                                .font(.pretendard(size: 16, weight: .semibold))
                                .foregroundColor(CFDAsset.Gray.g300.swiftUIColor)
                        )
                    } else {
                        SecureField(
                            "CFDSecureTFKey",
                            text: $text,
                            prompt: Text(prompt)
                                .font(.pretendard(size: 16, weight: .semibold))
                                .foregroundColor(CFDAsset.Gray.g300.swiftUIColor)
                        )
                    }
                   
                }
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .font(.pretendard(size: 16))
                .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                .padding(.horizontal, 12)
            }
            
    }
}


