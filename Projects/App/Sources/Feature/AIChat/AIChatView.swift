import SwiftUI

struct AIChatView: View {
    
    @EnvironmentObject var _rootVM: RootViewModel
    
    @StateObject var _chatVM = AIChatViewModel()

    
    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { scrollview in
                    LazyVStack {
                        ForEach(_chatVM.messages) { message in
                            Group {
                                switch(message.type) {
                                case .ai: VStack(alignment: .leading, spacing: 12) {
                                    HStack(spacing: 2) {
                                        CFDAsset.Icon.aiReview.swiftUIImage
                                        
                                        Text("AI 챗봇")
                                            .font(.pretendard(size: 16, weight: .semibold))
                                        
                                        Spacer()
                                    }
                                    .foregroundStyle(CFDAsset.Primary.p900.swiftUIColor)
                                    
                                    
                                    Text(message.text)
                                        .font(.pretendard(size: 16, weight: .medium))
                                        .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                                    
                                }
                                    
                                    
                                case .me: HStack {
                                    Spacer()
                                    
                                    ChatBubble(text: message.text)
                                    
                                }
                                    
                                }
                                
                                
                                Spacer()
                                    .frame(height: 25)
                                
                                
                            }
                            
                            
                        }
                        
                        Spacer()
                            .frame(height: 20)
                            .id("Anchor")
                        
                    }
                    .onReceive(_chatVM.$messages) { messages in
                        withAnimation {
                            scrollview.scrollTo("Anchor", anchor: .bottom)
                        }
                        
                        
                    }
                    
                }
                
                
            }
            .scrollIndicators(.hidden)
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: 0xF8F8F8))
                .frame(height: 48)
                .overlay {
                    HStack {
                        TextField(
                            "CFDTFKey",
                            text: $_chatVM.chatRequest.question,
                            prompt: Text("무엇이든 물어봐주세요!")
                                .font(.pretendard(size: 16, weight: .semibold))
                                .foregroundColor(CFDAsset.Gray.g300.swiftUIColor)
                        )
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .font(.pretendard(size: 16, weight: .semibold))
                        .foregroundStyle(CFDAsset.Gray.g700.swiftUIColor)
                        .onSubmit {
                            _chatVM.fetchMessages()
                        }
                        
                        Button {
                            _chatVM.fetchMessages()
                        } label: {
                            CFDAsset.Icon.send.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .tint(CFDAsset.Gray.g500.swiftUIColor)
                        }
                        
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                }
            
            Spacer()
                .frame(height: 12)
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .navigationBarBackButtonHidden()
        .toolbarBackground(Color.white, for: .automatic)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    _rootVM.paths.removeLast()
                } label: {
                    HStack {
                        CFDAsset.Icon.arrowLeft.swiftUIImage
                        
                        Text("AI 챗봇")
                            .font(.pretendard(size: 18, weight: .semibold))
                    }
                    .tint(Color(hex: 0x121212))
                }
            }
        }
        
        
        
    }
}
