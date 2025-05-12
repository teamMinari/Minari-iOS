import SwiftUI

struct SignoutButton: View {
    
    @EnvironmentObject var _rootVM: RootViewModel
    
    @Binding var isPresented: Bool
    
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .frame(height: 170)
            .overlay {
                VStack(spacing: 16) {
                    CFDAsset.Icon.logout.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                    
                    VStack(spacing: 4) {
                        Text("정말로 로그아웃 하시겠습니까?")
                            .font(.pretendard(size: 16, weight: .semibold))
                            .foregroundStyle(Color.black)
                        
                        Text("삭제 시 복구가 불가합니다.")
                            .font(.pretendard(size: 12))
                            .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            if KeyChain.delete() {
                                isPresented = false
                                _rootVM.tabSelection = .home
                            }
                        } label: {
                            Text("삭제")
                                .tint(Color(hex: 0x0C21C1))
                        }
                        
                        Spacer()
                        
                        Button {
                            isPresented = false
                        } label: {
                            Text("취소")
                                .tint(Color.black)
                        }
                        
                        Spacer()
                    }
                    .font(.pretendard(size: 14, weight: .semibold))
                    
                    
                }
                .padding(20)
            }
    }
}
