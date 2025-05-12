import SwiftUI

struct SignupTopicView: View {
    
    @EnvironmentObject var _rootVM: RootViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                
                Spacer()
                    .frame(maxHeight: 44)
                
                HStack(spacing: 0) {
                    Text("어떤 주제에 관심이\n있으신가요?")
                        .font(.pretendard(size: 20, weight: .bold))
                        .lineLimit(2)
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                    
                }
                
                Spacer()
                    .frame(maxHeight: 36)
                
                
                LazyVGrid(columns: Array(repeating: .init(), count: 3)) {
                    ForEach(0..<20) { i in
                        HStack(spacing: 0) {
                            Spacer()
                            
                            SelectTopicButton("\(i)", isSelected: .constant(false))
                            
                            Spacer()
                        }
                    }
                }
                
                
                
                
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            
            
            AuthBottomButton {
                
                _rootVM.popToRoot()
                _rootVM.paths.append(CFDAuthViews.signin)
                
            }
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
