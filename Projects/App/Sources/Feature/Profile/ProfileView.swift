import SwiftUI


struct ProfileView: View {
    @EnvironmentObject var _rootVM: RootViewModel
    @EnvironmentObject var _profileVM: ProfileViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    Spacer()
                        .frame(maxHeight: 10)
                    
                    ProfileCard(item: _profileVM.response)
                        .skeleton(_profileVM.response == nil, shape: RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal, 25)
                    
                    ZStack(alignment: .top) {
                        Circle()
                            .stroke(CFDAsset.Gray.g200.swiftUIColor, style: .init(lineWidth: 5))
                            .frame(width: 250, height: 250, alignment: .center)
                            .overlay {
                                Circle()
                                    .trim(from: 0.2, to: 0.8)
                                    .trim(from: 0, to: 0.7)
                                    .stroke(Color(hex: 0x28A745), style: .init(lineWidth: 5))
                                    .rotationEffect(.degrees(90))
                            }
                            .overlay {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 240, height: 240, alignment: .center)
                                    .overlay {
                                        GeometryReader { reader in
                                            VStack(spacing: 7) {
                                                CFDAsset.Image.farmer.swiftUIImage
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 85, height: 85)
                                                
                                                Text("슬기로운 포도알")
                                                    .font(.pretendard(size: 16, weight: .semibold))
                                            }
                                            
                                            .position(x: reader.frame(in: .local).width / 2, y: (reader.frame(in: .local).height / 2) - 44)
                                        }
                                    }
                            }
                        
                        VStack {
                            Spacer()
                                .frame(height: 152)
                            
                            VStack(spacing: 20) {
                                Spacer()
                                    .frame(maxHeight: 40)
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("현재 보유 포인트")
                                        .font(.pretendard(size: 18, weight: .semibold))
                                        .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                                    
                                    HStack {
                                        Text("2,584 P")
                                            .font(.pretendard(size: 32, weight: .bold))
                                            .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                                        
                                        
                                        Spacer()
                                        
                                        Button {
                                            
                                        } label: {
                                            Text("소비하러가기>")
                                                .font(.pretendard(size: 18, weight: .semibold))
                                                .tint(CFDAsset.Primary.p300.swiftUIColor)
                                        }
                                    }
                                }
                                
                                
                                Rectangle()
                                    .fill(Color(hex: 0xECEFFB))
                                    .frame(height: 1)
                                
                                ProfileTitleCard()
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("저장 목록")
                                        .font(.pretendard(size: 16, weight: .semibold))
                                    
                                    SavesButton(.tutorial)
                                    
                                    SavesButton(.words)
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("내 관심사")
                                        .font(.pretendard(size: 16, weight: .semibold))
                                    
                                    HStack {
                                        Text("10대/선신")
                                            .font(.pretendard(size: 16, weight: .semibold))
                                            .foregroundStyle(Color(hex: 0x6A6A6A))
                                        
                                        Spacer()
                                        
                                        Button {
                                            
                                        } label: {
                                            Text("변경하러가기>")
                                                .font(.pretendard(size: 14))
                                                .foregroundStyle(CFDAsset.Primary.p300.swiftUIColor)
                                        }
                                    }
                                }
                                
                                Spacer()
                                    .frame(maxHeight: 40)
                                
                                
                            }
                            .padding(.horizontal, 25)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color(hex: 0xECEFFB))
                                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
                            )
                        }
                        
                    }
                    
                    Spacer(minLength: 60)
                    
                    
                    
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(CFDAsset.Gray.g50.swiftUIColor)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        _profileVM.isSignoutPresented = true
                        
                    } label: {
                        CFDAsset.Icon.logout.swiftUIImage
                            .tint(CFDAsset.Gray.g400.swiftUIColor)
                    }
                }
            }
            
            
            
            if _profileVM.isSignoutPresented {
                ZStack {
                    Color.black.opacity(0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                            _profileVM.isSignoutPresented = false
                            
                        }
                    
                    
                    SignoutButton(isPresented: $_profileVM.isSignoutPresented)
                        .environmentObject(_rootVM)
                        .padding(.horizontal, 42)
                    
                }
                
                
            }
            
        }
        .onReceive(_profileVM.$isSignoutPresented) { value in
            _rootVM.isTabBarHidden = _profileVM.isSignoutPresented
        }
        .onAppear {
            if _profileVM.response == nil {
                _profileVM.getProfile()
            }
        }
        
        
        
    }
}

#Preview {
    ProfileView()
}
