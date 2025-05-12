import Foundation

extension Bundle {
    var url: String {
        guard let file = self.path(forResource: "ApiContent", ofType: "plist") else {
            return "파일이 잘못되었습니다."
        }
        
        
        guard let resource = NSDictionary(contentsOf: URL(fileURLWithPath: file)) else {
            return "리소스가 잘못되었습니다"
        }
        
        let url = "\(resource["URL"]!)"
        
        
        return url
    }
}
