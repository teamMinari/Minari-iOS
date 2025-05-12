import SwiftUI
import Moya

enum AuthService {
    case signin( _ request: SigninRequest )
    case signup( _ request: SignupRequest )
    case refresh( _ request: RefreshRequest )
    
}


extension AuthService: BaseService {
    var root: String {
        "member"
    }
    
    var path: String {
        switch self {
        case .signin: "/login"
        case .signup: "/register"
        case .refresh: "/refresh"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signin: .post
        case .signup: .post
        case .refresh: .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signin(let request): .requestParameters(parameters: request.params, encoding: JSONEncoding.default)
        case .signup(let request): .requestParameters(parameters: request.params, encoding: JSONEncoding.default)
        case .refresh(let request): .requestParameters(parameters: request.params, encoding: JSONEncoding.default)
        }
    }
    
    
}
