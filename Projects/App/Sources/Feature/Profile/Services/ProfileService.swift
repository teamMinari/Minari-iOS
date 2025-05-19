import SwiftUI
import Moya

enum ProfileService {
    case get
    case giveExp( _ request: ExpRequest )
    case givePoint( _ request: GivePointRequest )
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
        case .giveExp: "/giveExp"
        case .givePoint: "/givePoint"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .get: .get
        case .giveExp: .post
        case .givePoint: .post

        }
    }
    
    var task: Moya.Task {
        switch self {
        case .get: .requestPlain
        case .giveExp(let request): .requestParameters(parameters: request.params, encoding: JSONEncoding.default)
        case .givePoint(let request): .requestParameters(parameters: request.params, encoding: JSONEncoding.default)
        }
    }
    
    
}
