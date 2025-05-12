import SwiftUI

struct SignupIdView: View {
    
    @EnvironmentObject var _rootVM: RootViewModel
    @EnvironmentObject var _authVM: AuthViewModel
    
    
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                
                Spacer()
                    .frame(maxHeight: 44)
                
                HStack(spacing: 0) {
                    Text("로그인 시 사용될 아이디를 작성해 주세요!")
                        .font(.pretendard(size: 20, weight: .bold))
                        .lineLimit(2)
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                        .frame(maxWidth: 80)
                }
                
                Spacer()
                    .frame(maxHeight: 60)
                
                CFDTextField(prompt: "아이디 입력", text: $_authVM.signupRequest.id)
                
                Spacer()
                    .frame(maxHeight: 12)
                
                CFDTextField(prompt: "이메일 입력", text: $_authVM.signupRequest.email)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            AuthBottomButton {
                
                _rootVM.paths.append(CFDAuthViews.signupPw)
            }
        }
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
