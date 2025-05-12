import SwiftUI



struct SavesButton: View {
    
    let type: SavesButtonType
    
    init(_ type: SavesButtonType) {
        self.type = type
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .strokeBorder(CFDAsset.Gray.g300.swiftUIColor)
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
            .frame(height: 80)
            .frame(maxWidth: .infinity)
            .overlay {
                HStack {
                    VStack(alignment: .leading) {
                        Text(type.title)
                            .font(.pretendard(size: 16, weight: .bold))
                            .foregroundStyle(CFDAsset.Primary.p700.swiftUIColor)
                        
                        Spacer()
                        
                        Text("저장목록 보러가기")
                            .font(.pretendard(size: 16, weight: .medium))
                            .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        CFDAsset.Icon.arrowRight.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .tint(CFDAsset.Gray.g900.swiftUIColor)
                    }
                }
                .padding(.leading, 60)
                .padding(.trailing, 20)
                .padding(.vertical, 16)
            }
            .overlay {
                
                GeometryReader { reader in
                    CFDAsset.Icon.banner.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(CFDAsset.Primary.p600.swiftUIColor)
                        .overlay {
                            type.icon
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.white)
                                .offset(y: -4)
                        }
                        .offset(x: 16, y: -5)
                        
                }
                    
            }
            .clipped()
            
    }
}


enum SavesButtonType {
    case tutorial, words
    
    var title: String {
        switch self {
        case .tutorial: "튜토리얼"
        case .words: "단어장"
        }
    }
    var icon: Image {
        switch self {
        case .tutorial:
            CFDAsset.Icon.tutorialFill.swiftUIImage
        case .words:
            CFDAsset.Icon.document.swiftUIImage
        }
    }
}
