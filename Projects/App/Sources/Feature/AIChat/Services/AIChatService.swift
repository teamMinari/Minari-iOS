import SwiftUI
import Moya

enum AIChatService {
    case chat( _ request: ChatRequest )
}

extension AIChatService: BaseService {
    var root: String {
        switch self {
        default: "chat"
        }
    }
    
    var path: String {
        switch self {
        case .chat: ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .chat: .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .chat(let request): .requestParameters(parameters: request.params, encoding: JSONEncoding.default)
        }
    }
    
    
}

