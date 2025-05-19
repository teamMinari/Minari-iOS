import SwiftUI
import Moya

enum QuizService {
    case get
}

extension QuizService: BaseService {
    var root: String {
        switch self {
        default: "questions"
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
        case .get: .requestPlain
        }
    }
    
    
}
