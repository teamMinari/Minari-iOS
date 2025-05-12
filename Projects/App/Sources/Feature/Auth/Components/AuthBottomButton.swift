import SwiftUI

struct AuthBottomButton: View {
    let text: String
    let action: () -> ()
    
    init(text: String = "다음", action: @escaping () -> ()) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            
            
            Rectangle()
                .fill(CFDAsset.Primary.p500.swiftUIColor)
                .frame(height: 44)
                .overlay {
                    Text(text)
                        .font(.pretendard(size: 16, weight: .semibold))
                        .foregroundStyle(Color.white)
                }
                .background {
                    GeometryReader { reader in
                        VStack {
                            Spacer(minLength: 0)
                            
                            Rectangle()
                                .fill(CFDAsset.Primary.p500.swiftUIColor)
                                .frame(maxHeight: reader.safeAreaInsets.bottom)
                        }
                        .ignoresSafeArea(.container)
                    }
                    
                }
            
            
            
            
        }
       
        
    }
}
