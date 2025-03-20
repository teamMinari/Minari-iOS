import SwiftUI

struct CFDTabView<Content: View>: View {
    @Binding var selection: CFDTabItem
    let content: Content
    
    init(selection: Binding<CFDTabItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var barOpacity: CGFloat = 1.0
    
    func hideBar(_ isDisappear: Bool = true) -> some View {
        var tabView = self
        tabView.barOpacity = isDisappear ? 0 : 1
        
        return tabView
    }
    
    
    
    var body: some View {
        
        ZStack {
            content
            
            
            GeometryReader { reader in
                VStack(spacing: 0) {
                    Spacer()
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 50)
                        .overlay {
                            HStack {
                                Spacer()
                                
                                ForEach(CFDTabItem.allCases, id: \.rawValue) { item in
                                    Button {
                                        selection = item
                                    } label: {
                                        item.icon
                                            .foregroundStyle(
                                                item == selection
                                                ? CFDAsset.Primary.tabAccent.swiftUIColor
                                                : CFDAsset.Gray.tabgray.swiftUIColor
                                            )
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 26, height: 26)
                                            
                                    }
                                    .disabled(item == selection)
                                    
                                    Spacer()
                                }
                            }
                            .padding(.horizontal, 36)
                        }
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: reader.safeAreaInsets.bottom)

                }
                .ignoresSafeArea()
               
            }
            .opacity(barOpacity)
        }
        
        
        
    }
}


#Preview {
    CFDTabView(selection: .constant(.home)) {
        HomeView()
    }
}
