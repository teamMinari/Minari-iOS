import SwiftUI
import Moya

enum TermsService {
    case search( _ request: TermsKeywordRequest )
    case getById( _ request: TermsIdRequest )
    case get( _ request: PageRequest )
}

extension TermsService: BaseService {
    var root: String {
        switch self {
        default: "terms"
        }
    }
    
    var path: String {
        switch self {
        case .search: "/keyword"
        case .getById(let request): "/\(request.termId)"
        case .get: ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search: .get
        case .getById: .get
        case .get: .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .search(let request): .requestParameters(parameters: request.params, encoding: URLEncoding.default)
        case .getById: .requestPlain
        case .get(let request): .requestParameters(parameters: request.params, encoding: URLEncoding.default)
        }
    }
    
    
}
