import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var _rootVM: RootViewModel
    
    @StateObject var _profileVM = ProfileViewModel()
    @StateObject var _homeVM = HomeViewModel()
    @StateObject var _newsVM = NewsViewModel()
    
    @StateObject var _quizVM = QuizViewModel()
    
    var body: some View {
        GeometryReader { reader in
            ZStack(alignment: .bottomTrailing) {
                CFDTabView(selection: $_rootVM.tabSelection) {
                    Group {
                        switch _rootVM.tabSelection {
                        case .tutorial:
                            TutorialView()
                        case .news:
                            NewsView()
                        case .home:
                            HomeView()
                                .environmentObject(_homeVM)
                        case .quiz:
                            QuizView()
                                .environmentObject(_quizVM)
                        case .profile:
                            ProfileView()
                        }
                    }
                    .scrollIndicators(.hidden)
                    .environmentObject(_rootVM)
                    .environmentObject(_profileVM)
                    .environmentObject(_newsVM)
                    
                }
                .hideBar(_rootVM.isTabBarHidden)
                
                if(_rootVM.tabSelection == .home && !_rootVM.isTabBarHidden && !_homeVM.isSearched) {
                    Button {
                        _rootVM.paths.append(CFDViews.aichat)
                    } label: {
                        VStack {
                            CFDAsset.Icon.chat.swiftUIImage
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            
                            Text("AI 챗봇")
                                .font(.pretendard(size: 12, weight: .semibold))
                        }
                        .foregroundStyle(CFDAsset.Primary.p800.swiftUIColor)
                        .padding(14)
                        .background(
                            CFDAsset.Primary.p50.swiftUIColor
                                .clipShape(Circle())
                        )


                    }
                    .padding(.bottom, reader.safeAreaInsets.bottom)
                    .padding(.horizontal, 30)
                    .padding(.vertical, reader.frame(in: .global).height / 10.5)
                }
                
            }
            .navigationDestination(for: CFDViews.self) { view in
                Group {
                    switch view {
                    case .aichat: AIChatView()
                    case .profileTopic: ProfileTopicView()
                    case .inQuiz: QuizIngameView().environmentObject(_quizVM)
                    }
                }
                .environmentObject(_rootVM)
                .environmentObject(_profileVM)
                
            }
        }
        
    }
}

