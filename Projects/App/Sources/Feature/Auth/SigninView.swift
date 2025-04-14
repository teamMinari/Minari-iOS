import SwiftUI

struct SigninView: View {
    @EnvironmentObject var _authVM: AuthViewModel
    @EnvironmentObject var _rootVM: RootViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Text("청포도")
                .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                .font(.rixanuai(size: 32))
            
            Spacer()
                .frame(maxHeight: 72)
            
            CFDTextField(prompt: "아이디 입력")
               
            
            Spacer()
                .frame(maxHeight: 12)
            
            CFDTextField(prompt: "비밀번호 입력")
                
            
            Spacer()
                .frame(maxHeight: 12)
            
            HStack {
                Button {
                    _authVM.isSavingToken.toggle()
                } label: {
                    HStack {
                        
                        _authVM.isSavingToken
                        ? CFDAsset.Icon.boxChecked.swiftUIImage
                            .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                        : CFDAsset.Icon.box.swiftUIImage
                            .foregroundStyle(CFDAsset.Gray.g200.swiftUIColor)
                        
                        
                        
                        Text("로그인 저장")
                            .font(.pretendard(size: 14))
                            .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                    }
                }
                
                Spacer()
            }
            
            Spacer()
                .frame(maxHeight: 80)
            
            
            CFDBottomButton {
                _rootVM.popToRoot()
                _rootVM.isDebug = true
            } content: {
                
                Text("로그인")
                    .font(.pretendard(size: 16, weight: .semiBold))
                    .foregroundStyle(Color.white)
                
            }
            
            Spacer()
                .frame(maxHeight: 12)
            
            
            CFDBottomButton(
                action: {
                    
                },
                content: {
                    HStack {
                        CFDAsset.Icon.google.swiftUIImage
                        
                        Text("구글로 계속하기")
                            .font(.pretendard(size: 16, weight: .semiBold))
                            .foregroundStyle(CFDAsset.Gray.g500.swiftUIColor)
                    }
                    
                },
                background: Color.white,
                strokeStyle: .init(lineWidth: 1),
                strokeColor: CFDAsset.Gray.g200.swiftUIColor
            )
            
            Spacer()
                .frame(maxHeight: 20)
            
            Button {
                
            } label: {
                HStack(spacing: 4) {
                    Text("아직 계정이 없다면?")
                        .foregroundStyle(CFDAsset.Gray.g500.swiftUIColor)
                    
                    Text("회원가입")
                        .fontWeight(.semibold)
                        .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                    
                }
                .font(.pretendard(size: 14))
            }
            
            Spacer()
            
            
        }
        .padding(.horizontal, 28)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    _rootVM.paths.removeLast()
                } label: {
                    CFDAsset.Icon.arrowLeft.swiftUIImage
                        .foregroundStyle(CFDAsset.Primary.p900.swiftUIColor)
                        .padding(8)
                }
            }
            
        }
        
        
    }
}

#Preview {
    NavigationView {
        SigninView()
    }
}
