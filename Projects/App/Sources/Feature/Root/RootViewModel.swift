import SwiftUI

class RootViewModel: ObservableObject {
    static let shared = RootViewModel()
    
    @Published var tabSelection: CFDTabItem = .home
    @Published var paths: NavigationPath = .init()
    
    @Published var isDebug: Bool = false
    
    var isSigned: Bool {
        return isDebug
    }
    
    func popToRoot() {
        paths.removeLast(paths.count)
    }

}
