import SwiftUI
import SafariServices

struct SafariViewer: UIViewControllerRepresentable {
    let url: String
    let vc: SFSafariViewController
   
    init(url: String) {
        self.url = url
        self.vc = SFSafariViewController(url: .init(string: url)!)
    }
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
