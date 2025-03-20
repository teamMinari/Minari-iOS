import SwiftUI

class RootViewModel: ObservableObject {
    static let shared = RootViewModel()
    
    @Published var tabSelection: CFDTabItem = .home

}
