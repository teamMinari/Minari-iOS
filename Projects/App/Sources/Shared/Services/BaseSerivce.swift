import SwiftUI
import Moya

protocol BaseService: TargetType {
    var root: String { get }
}

extension BaseService {

    var baseURL: URL {
        .init(string: Bundle.main.url)!
        .appendingPathComponent(root)
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
}


