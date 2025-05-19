import SwiftUI

class NavigationManager {
    
    static let instance = NavigationManager()
    
    let nowVC = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController
    
    func present(next: some View) {
        let nextVC = UIHostingController(rootView: next)
        nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        if let nowVC = nowVC {
            nowVC.present(nextVC, animated: true)
        }
    }
    
}
