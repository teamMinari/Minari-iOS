import SwiftUI

struct SignupPwView: View {
    @EnvironmentObject var _rootVM: RootViewModel
    @EnvironmentObject var _authVM: AuthViewModel

    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                
                Spacer()
                    .frame(maxHeight: 44)
                
                HStack(spacing: 0) {
                    Text("로그인 시 사용될 비밀번호를 작성해 주세요!")
                        .font(.pretendard(size: 20, weight: .bold))
                        .lineLimit(2)
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                        .frame(maxWidth: 80)
                }
                
                Spacer()
                    .frame(maxHeight: 60)
                
                CFDTextField(prompt: "비밀번호 입력", text: $_authVM.signupRequest.password)
                
                Spacer()
                    .frame(maxHeight: 12)
                
                CFDTextField(prompt: "비밀번호 확인", text: $_authVM.signupRequest.confirmPassword)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            AuthBottomButton {
                print(_authVM.signupRequest.params)
                _rootVM.paths.append(CFDAuthViews.signupTopic)
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
