import SwiftUI
import Moya

enum NewsService {
    case get( _ request: NewsRequest )
}

extension NewsService: BaseService {
    var root: String {
        switch self {
        default: "news"
        }
    }
    
    var path: String {
        switch self {
        case .get: ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .get: .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .get(let request): .requestParameters(parameters: request.params, encoding: URLEncoding.default)
        }
    }
    
    
}
