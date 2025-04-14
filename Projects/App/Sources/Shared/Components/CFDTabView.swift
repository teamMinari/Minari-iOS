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
        GeometryReader { reader in
            
            ZStack {
                content
                
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 72)
                        .overlay {
                            HStack {
                                Spacer()
                                
                                ForEach(CFDTabItem.allCases, id: \.rawValue) { item in
                                    Button {
                                        selection = item
                                    } label: {
                                        VStack(spacing: 6) {
                                            Group {
                                                if item == selection {
                                                    item.iconFill
                                                } else {
                                                    item.icon
                                                }
                                                
                                            }
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24, height: 24)
                                            
                                            Text(item.name)
                                                .font(.pretendard(size: 12))
                                            
                                        }
                                        .foregroundStyle(
                                            item == selection
                                            ? CFDAsset.Primary.p500.swiftUIColor
                                            : CFDAsset.Gray.g300.swiftUIColor
                                        )
                                        
                                        
                                    }
                                    .disabled(item == selection)
                                    
                                    Spacer()
                                }
                            }
                            .padding(.horizontal, reader.size.width / 12)
                        }
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: reader.safeAreaInsets.bottom)
                    
                    
                }
                .ignoresSafeArea()
                .opacity(barOpacity)

                
            }
        }
        
        
        
    }
}
