import SwiftUI

struct SignupTopicView: View {
    
    @EnvironmentObject var _rootVM: RootViewModel
    @EnvironmentObject var _authVM: AuthViewModel
    
    @AppStorage("savedTopic") var savedTopic: Data?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                
                Spacer()
                    .frame(maxHeight: 44)
                
                HStack(spacing: 0) {
                    Text("어떤 주제에 관심이\n있으신가요?")
                        .font(.pretendard(size: 20, weight: .bold))
                        .lineLimit(2)
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                    
                }
                
                Spacer()
                    .frame(maxHeight: 36)
                
                
                LazyVGrid(columns: Array(repeating: .init(.flexible(maximum: 64)), count: 3)) {
                    ForEach($_authVM.topics, id: \.self) { $item in
                        HStack(spacing: 0) {
                            SelectTopicButton(item.name, isSelected: item.isEnable) {
                                if !item.isEnable {
                                    $_authVM.topics.forEach { $item in
                                        item.isEnable = false
                                    }
                                    
                                    _authVM.savedTopic = .init(topic: item.name, job: _authVM.savedTopic.job)
                                    
                                    
                                    item.isEnable = true
                                }
                            }
                        }
                    }
                }
                .padding(.trailing, 30)
                
                
                
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            
            
            AuthBottomButton {
                
                if _authVM.savedTopic.topic == nil {
                    _authVM.signupAlertMessage = .topic
                    _authVM.signupAlert = true
                    return
                }
                
                savedTopic = _authVM.savedTopic.encode()!
                
                _authVM.signup {
                    _rootVM.popToRoot()
                    _rootVM.paths.append(CFDAuthViews.signin)
                } onError: {
                    print("signup error")
                }
                
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
        .alert(isPresented: $_authVM.signupAlert) {
            Alert(title: Text("알림"), message: Text(_authVM.signupAlertMessage.message),
                             dismissButton: .default(Text("확인")))
        }
        
        
    }
}
