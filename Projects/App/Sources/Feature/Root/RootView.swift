import SwiftUI

struct RootView: View {
    
    @StateObject var rootVM = RootViewModel.shared
    
    var body: some View {
        NavigationStack {
            CFDTabView(selection: $rootVM.tabSelection) {
                switch rootVM.tabSelection {
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
            .hideBar(false)
        }
    }
}

#Preview {
    RootView()
}
