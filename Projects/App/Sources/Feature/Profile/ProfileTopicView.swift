import SwiftUI

struct ProfileTopicView: View {
    
    @EnvironmentObject var _rootVM: RootViewModel
    @EnvironmentObject var _profileVM: ProfileViewModel
    
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
                    ForEach($_profileVM.topics, id: \.self) { $item in
                        HStack(spacing: 0) {
                            SelectTopicButton(item.name, isSelected: item.isEnable) {
                                if !item.isEnable {
                                    $_profileVM.topics.forEach { $item in
                                        item.isEnable = false
                                    }
                                    
                                    _profileVM.savedTopic = .init(topic: item.name, job: _profileVM.savedTopic.job)
                                    
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
            
            
            
            AuthBottomButton(text: "수정") {
                if (_profileVM.savedTopic.encode() != nil) {
                    savedTopic = _profileVM.savedTopic.encode()!
                    
                    _rootVM.paths.removeLast()
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
        
    }
}
