import SwiftUI
import Kingfisher


struct ProfileCard: View {
    
    let item: ProfileResponse?
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(CFDAsset.Gray.g200.swiftUIColor)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
            .frame(height: 90)
            .overlay {
                if let item = item {
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: 5) {
                                Text(item.id)
                                    .font(.pretendard(size: 20))
                                
                                
                                Text("님")
                                    .font(.pretendard(size: 18))
                                
                                
                                Rectangle()
                                    .fill(CFDAsset.Gray.g900.swiftUIColor)
                                    .frame(width: 1, height: 18)
                                
                                Text("소비대왕")
                                    .font(.pretendard(size: 12))
                                
                                
                                
                            }
                            .fontWeight(.semibold)
                            
                            
                            
                            Text(verbatim: item.email)
                                .font(.pretendard(size: 12))
                            
                            
                            
                        }
                        .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                        
                        Spacer()
                        
                        KFImage(URL(string: "https://picsum.photos/200"))
                            .placeholder {
                                CFDAsset.Gray.g100.swiftUIColor
                            }
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
                        
                    }
                    .padding(.horizontal, 30)
                }
                
            }
    }
}
