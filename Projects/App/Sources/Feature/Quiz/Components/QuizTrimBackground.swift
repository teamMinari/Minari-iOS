import SwiftUI

struct QuizTrimBackground: View {
    var body: some View {
        
        CFDAsset.Image.quizTrimBackground.swiftUIImage
            .resizable()
            .scaledToFill()
            .foregroundStyle(Color.white)
            .background {
                GeometryReader { reader in
                    Circle()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.white)
                        .position(x: reader.size.width * 0.4)
                        .offset(y: -16)
                    
                }
                
            }
        
        
        
        
        
        
    }
    
}

#Preview {
    ScrollView {
        VStack {
            
            
            QuizTrimBackground()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(CFDAsset.Gray.g50.swiftUIColor)
    }
}
