import SwiftUI

struct HomeSearchButton: View {
    
    let title: String
    let action: () -> ()
    
    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 8) {
                CFDAsset.Icon.search.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .tint(CFDAsset.Gray.g400.swiftUIColor)
                    .frame(width: 16, height: 16)
                    .padding(2)
                    .background(Circle().fill(CFDAsset.Gray.g100.swiftUIColor))
                
                Text(title)
                    .font(.pretendard(size: 16, weight: .medium))
                    .foregroundStyle(CFDAsset.Gray.g400.swiftUIColor)
                
                Spacer()
            }
        }
    }
}
