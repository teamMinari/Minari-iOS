import SwiftUI

struct QuizButton: View {
    let style: QuizButtonStyle
    
    init(_ style: QuizButtonStyle) {
        self.style = style
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(AnyShapeStyle(getBackground()))
            .frame(height: 130)
            .overlay {
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 15) {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.white, style: .init())
                            .frame(width: 35, height: 35)
                            .overlay {
                                getIcon()
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(Color.white)
                                    .padding(style == .review ? 8 : 0)
                            }
                        
                        Button {
                            
                        } label: {
                            HStack(spacing: -4) {
                                Text(getTitle())
                                    .font(.pretendard(size: 18, weight: .semibold))
                                
                                CFDAsset.Icon.arrowRight.swiftUIImage
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                        }
                        .foregroundStyle(Color.white)

                    }
                    
                    Spacer()
                    
                    VStack(spacing: 0) {
                        Spacer()
                        
                        getImage()
                    }
                }
                .padding(.leading, 24)
            }
            .clipped()
    }
        
    
    
    func getTitle() -> String {
        switch style {
        case .economy:
            return "경제퀴즈"
        case .review:
            return "복습퀴즈"
        case .custom(let title, _, _, _):
            return title
        }
    }
    
    func getIcon() -> Image {
        switch style {
        case .economy:
            return CFDAsset.Icon.book.swiftUIImage
        case .review:
            return CFDAsset.Icon.reset.swiftUIImage
        case .custom(_, let icon, _, _):
            return icon ?? CFDAsset.Icon.book.swiftUIImage
        }
    }
    
    func getBackground() -> any ShapeStyle {
        switch style {
        case .economy:
            return LinearGradient(
                stops: [
                    .init(color: Color(hex: 0x6889FF), location: 0),
                    .init(color: Color(hex: 0xFF64F5), location: 3)
                ],
                startPoint: .top,
                endPoint: .bottom)
            
        case .review:
            return LinearGradient(
                stops: [
                    .init(color: Color(hex: 0x2EDCC4), location: 0),
                    .init(color: Color(hex: 0x266DD3), location: 3)
                ],
                startPoint: .top,
                endPoint: .bottom)
            
        case .custom(_, _, let background, _):
            return background
        }
    }
    
    
    
    func getImage() -> Image {
        switch style {
        case .economy:
            return CFDAsset.Image.quizBackground.swiftUIImage
        case .review:
            return CFDAsset.Image.quizBackgroundTwo.swiftUIImage
        case .custom(_, _, _, let image):
            return image ?? CFDAsset.Image.quizBackground.swiftUIImage
        }
    }
}


enum QuizButtonStyle: Equatable {
    case economy, review, custom(title: String, icon: Image?, background: Color, image: Image?)
    
    
}


#Preview {
    QuizButton(.review)
}
