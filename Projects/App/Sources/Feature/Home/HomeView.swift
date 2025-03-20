import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 30)
                .strokeBorder(CFDAsset.Gray.bluegray.swiftUIColor, lineWidth: 1)
                .background (
                    GeometryReader { reader in
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundStyle(Color.white)
                            .overlay {
                                VStack {
                                    Spacer()
                                    
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .foregroundStyle(CFDAsset.Gray.circleBackground.swiftUIColor.opacity(0.3))
                                                .frame(width: reader.size.width / 1.59, height: reader.size.width / 1.59)
                                                .overlay {
                                                    Circle()
                                                        .strokeBorder(CFDAsset.Stroke.backCircle.swiftUIColor.opacity(0.2), lineWidth: 1)
                                                    
                                                }
                                            
                                            Circle()
                                                .fill(Color.white.opacity(0.3))
                                                .frame(width: reader.size.width / 2.9, height: reader.size.width / 2.9)
                                                .overlay {
                                                    Circle()
                                                        .strokeBorder(CFDAsset.Stroke.backCircle.swiftUIColor.opacity(0.4), lineWidth: 1)
                                                }
                                                .offset(x: 74, y: 56)
                                            
                                            CFDAsset.Image.book.swiftUIImage
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: reader.size.width / 2.48, height: reader.size.height / 1.97)
                                                .offset(x: 78, y: -40)
                                                
                                            
                                            
                                        }
                                        .offset(x: -(reader.size.width / 5.4), y: reader.size.height / 5.8)
                                        .mask(RoundedRectangle(cornerRadius: 30))
                                        
                                        
                                        Spacer()
                                        
                                    }
                                }
                                .clipped()
                            }
                            .overlay {
                                
                            }
                    }
                )
                .frame(height: 320)
                .padding(.bottom, 30)
                .overlay {
                    VStack {
                        Spacer()
                        
                        
                        Button {
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 250, height: 55)
                                .foregroundStyle(LinearGradient(
                                    gradient: .init(colors: [
                                        CFDAsset.Primary.grdBlue.swiftUIColor,
                                        CFDAsset.Primary.grdViolet.swiftUIColor
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
                                .shadow(color: Color.black.opacity(0.25), radius: 7, x: 4, y: 4)
                                .overlay {
                                    Text("학습하러 가기")
                                        .font(.pretendard(size: 20, weight: .semiBold))
                                        .foregroundStyle(Color.white)
                                }
                        }
                        
                    }
                }
                .ignoresSafeArea()
            
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(CFDAsset.Gray.background.swiftUIColor)
        
    }
}
