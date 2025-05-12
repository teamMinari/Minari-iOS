import SwiftUI


struct OnboardingView: View {
    
    @StateObject var _obVM = OnboardingViewModel()
    @StateObject var _authVM = AuthViewModel()
    
    @EnvironmentObject var _rootVM: RootViewModel
    
    
    let screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .trailing, spacing: 12) {
                
                IntroBubble {
                    HStack(spacing: 3) {
                        Text("청포도")
                            .font(.rixanuai(size: 20))
                            .foregroundStyle(Color(hex: 0x3036C8))
                        
                        Text("에 온걸 환영해~")
                            .font(.pretendard(size: 20, weight: .medium))
                    }
                    
                }
                
                .offset(y : _obVM.isIntroPlaying ? 0 : -(screenHeight / 2.9))
                .animation(
                    _obVM.isAnimationDisabled ? nil : .easeOut(duration: 0.3).delay(1), value: _obVM.isIntroPlaying
                )
                
                
                IntroBubble {
                    Text("청포도는 처음이야?")
                        .font(.pretendard(size: 20, weight: .medium))
                }
                .offset(y : _obVM.isIntroPlaying ? 0 : -(screenHeight / 2.1))
                .animation(
                    _obVM.isAnimationDisabled ? nil : .easeIn(duration: 0.3), value: _obVM.isIntroPlaying
                )
                
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal, 24)
            
            
            
            Spacer()
            
            VStack {
                HStack(alignment: .center, spacing: 11) {
                    CFDAsset.Icon.logo.swiftUIImage
                        .resizable()
                        .frame(width: 28, height: 38)
                        .foregroundStyle(Color(hex: 0x3036C8))
                        .shadow(color: Color(hex: 0x10104B), radius: 45, x: 12, y: 12)
                    
                    
                    
                    Text("청포도")
                        .font(.rixanuai(size: 40))
                        .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                    
                }
                
                Spacer()
                    .frame(maxHeight: 50)
                
                
                VStack(spacing: 12) {
                    CFDBottomButton {
                        _rootVM.paths.append(CFDAuthViews.signin)
                    } content: {
                        Text("네, 사용해 본 적이 있어요.")
                            .font(.pretendard(size: 16, weight: .bold))
                            .foregroundColor(Color.white)
                    }
                    
                    CFDBottomButton(
                        action: {
                            _rootVM.paths.append(CFDAuthViews.signupId)
                        },
                        content: {
                            Text("아니요, 이번이 처음이에요.")
                                .font(.pretendard(size: 16, weight: .bold))
                                .foregroundColor(CFDAsset.Gray.g500.swiftUIColor)
                        },
                        background: Color.white,
                        strokeStyle: .init(lineWidth: 1),
                        strokeColor: CFDAsset.Gray.g200.swiftUIColor
                    )
                }
                .padding(.horizontal, 50)
                
                
                Spacer()
                    .frame(maxHeight: 110)
                
                
                
                CFDAsset.Image.friends.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(1.2)
                    .offset(x: -24, y: 40)
            }
            .offset(y : _obVM.isIntroPlaying ? 0 : screenHeight / 4.7)
            .animation(
                _obVM.isAnimationDisabled ? nil : .easeOut(duration: 0.3).delay(1), value: _obVM.isIntroPlaying
            )
            
            
            
            
        }
        .onAppear {
            if (!_obVM.isIntroPlaying) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    _obVM.isIntroPlaying = true
                }
            }
        }
        .navigationDestination(for: CFDAuthViews.self) { view in
            Group {
                switch view {
                case .signin: SigninView()
                case .signupId: SignupIdView()
                case .signupPw: SignupPwView()
                case .signupJob: SignupJobView()
                case .signupTopic: SignupTopicView()
                }
            }
            .environmentObject(_authVM)
            .environmentObject(_rootVM)
            
        }
        .onAppear {
            _authVM.signupRequest = .init()
        }
        
        
    }
    
}

#Preview {
    OnboardingView()
}
