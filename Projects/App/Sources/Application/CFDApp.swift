import SwiftUI


@main
struct CFDApp: App {
    
    init() {
        NavBarApperance.initBackground()
        
    }
    
    @StateObject var _rootVM = RootViewModel.shared
    
    var body: some Scene {
        
        WindowGroup {
            NavigationStack(path: $_rootVM.paths) {
                Group {
                    if _rootVM.isSigned {
                        RootView()
                            
                    } else {
                        OnboardingView()
                    }
                }
                .environmentObject(_rootVM)
                .transaction {
                    $0.animation = .none
                }
                
                
            }
         
            
        }
        
    }
}

