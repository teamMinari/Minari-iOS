import SwiftUI

struct SigninView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(maxHeight: 28)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("로그인")
                        .font(.pretendard(size: 25, weight: .semiBold))
                        .padding(.bottom, 2)
                    
                    Text("아직 회원가입을 하지 않았다면")
                        .font(.pretendard(size: 15))
                    
                    Button {
                        
                    } label: {
                        Text("회원가입")
                            .font(.pretendard(size: 15, weight: .semiBold))
                            .tint(CFDAsset.Primary.blue.swiftUIColor)
                    }
                }
                
                Spacer()
            }
            
            Spacer()
                .frame(maxHeight: 60)
            
            VStack(alignment: .leading, spacing: 16) {
                TextField("authTF", text: .constant(""), prompt: Text("아이디 입력"))
                
                Spacer()
                    .frame(maxHeight: 58)
                
                TextField("authTF", text: .constant(""), prompt: Text("비밀번호 입력"))
                
                
                Button {
                    
                } label: {
                    HStack {
                        
                        Text("로그인 저장")
                        
                    }
                }
            }
            
            Spacer()
                .frame(maxHeight: 70)
            
            CFDBottomButton {
                Text("로그인")
                    .font(.pretendard(size: 15, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
        }
        .padding(.horizontal, 28)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                CFDAsset.Icon.logo.swiftUIImage
                    .padding(.horizontal, 10)
            }
            
        }
    }
}

#Preview {
    NavigationView {
        SigninView()
    }
}
