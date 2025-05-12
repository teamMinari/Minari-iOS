import SwiftUI
import Moya

enum ProfileService {
    case get
}

extension ProfileService: BaseService {
    var root: String {
        switch self {
        default: "member"
        }
    }
    
    var path: String {
        switch self {
        case .get: "/profile"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .get: .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .get: .requestPlain
        }
    }
    
    
}
