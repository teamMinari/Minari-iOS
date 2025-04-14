import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var _rootVM: RootViewModel
    
    var body: some View {
        
        CFDTabView(selection: $_rootVM.tabSelection) {
            Group {
                switch _rootVM.tabSelection {
                case .tutorial:
                    TutorialView()
                case .news:
                    NewsView()
                case .home:
                    HomeView()
                case .quiz:
                    QuizView()
                case .profile:
                    ProfileView()
                }
            }
            .environmentObject(_rootVM)
        }
        .hideBar(false)
        
    }
}

#Preview {
    RootView()
}
