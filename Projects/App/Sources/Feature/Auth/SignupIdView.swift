import SwiftUI

struct SignupIdView: View {
    
    @EnvironmentObject var _rootVM: RootViewModel
    
    var body: some View {
        VStack {
            Text("SignupIdView")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    _rootVM.paths.removeLast()
                } label: {
                    CFDAsset.Icon.arrowLeft.swiftUIImage
                        .foregroundStyle(CFDAsset.Primary.p900.swiftUIColor)
                        .padding(8)
                }
            }
            
        }
    }
}
