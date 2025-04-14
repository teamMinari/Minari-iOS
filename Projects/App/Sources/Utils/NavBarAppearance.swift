import SwiftUI

struct NavBarApperance {
    static func initBackground() {
        let navBarAppear = UINavigationBarAppearance()
        navBarAppear.configureWithTransparentBackground()
        navBarAppear.backgroundColor = .white
        
        UINavigationBar.appearance().standardAppearance = navBarAppear
        UINavigationBar.appearance().compactAppearance = navBarAppear
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppear
        
        
    }
    
}
