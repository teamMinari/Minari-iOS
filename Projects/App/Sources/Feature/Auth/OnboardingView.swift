import SwiftUI


struct OnboardingView: View {
    var body: some View {
        HStack {
            CFDAsset.Assets.
            
            Text("청포도")
                .font(.rixanuai(size: 30))
                .foregroundStyle(CFDAsset.Primary.blue.swiftUIColor)
            
        }
    }
}

#Preview {
    OnboardingView()
}
