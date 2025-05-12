import SwiftUI

class RootViewModel: ObservableObject {
    static let shared = RootViewModel()
    
    @Published var tabSelection: CFDTabItem = .home
    @Published var paths: NavigationPath = .init()
    
    @Published var isTabBarHidden: Bool = false
    
    @Published var isDebug: Bool = true
    
    var isSigned: Bool {
        return KeyChain.read() != nil
    }
    
    func popToRoot() {
        paths.removeLast(paths.count)
    }

}
