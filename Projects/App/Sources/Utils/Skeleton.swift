import SwiftUI

struct Skeleton<ClipShape: Shape>: ViewModifier {
    var isEnabled: Bool
    var shape: ClipShape?
    
    init(isEnabled: Bool, shape: ClipShape? = nil) {
        self.isEnabled = isEnabled
        self.shape = shape
    }
    
    func body(content: Content) -> some View {
        if isEnabled {
            content
                .opacity(0.0)
                .overlay {
                    GeometryReader { reader in
                        Group {
                            if let shape = shape {
                                CFDAsset.Gray.g100.swiftUIColor
                                    .clipShape(shape)
                            } else {
                                CFDAsset.Gray.g100.swiftUIColor
                            }
                        }
                        .frame(width: reader.frame(in: .local).width, height: reader.frame(in: .local).height)
                        
                        
                        
                    }
                }
        } else {
            content
        }
        
        
    }
    
}

extension View {
    
    	
    @ViewBuilder func skeleton<ClipShape: Shape>(_ isEnabled: Bool, shape: ClipShape?) -> some View {
        self
            .modifier(Skeleton(isEnabled: isEnabled, shape: shape))
    }
    
}
