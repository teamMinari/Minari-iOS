import SwiftUI
import Alamofire
import Moya

class AuthViewModel: ObservableObject {
    @Published var isSavingToken: Bool = true
    
    @Published var signupRequest = SignupRequest()
    
    @Published var signinRequest = SigninRequest(id: "", password: "")
    
    @Published var googleLoginAlert: Bool = false
    @Published var signupAlert: Bool = false
    
    @Published var signupAlertMessage: SignupAlert = .id
    
    @Published var savedTopic: SavedTopic = .init(job: "직장인")
    
    @Published var topics: [Topic] = [.init(name: "10대"), .init(name: "20대"), .init(name: "30대"), .init(name: "40대")]
    
    let provider = MoyaProvider<AuthService>()
    
    
    func signin( onCompleted: @escaping () -> Void, onError: @escaping () -> Void ) {
        
        provider.request(.signin(signinRequest)) { response in
            switch response {
            case .success(let response):
                guard let result = try? JSONDecoder().decode(BaseResponse<SigninResponse>.self, from: response.data) else {
                    onError()
                    return
                }
                
                if result.status == StatusCode.OK.rawValue {
                    
                    guard let data = result.data else {
                        return
                    }
                    
                    
                    guard KeyChain.create(token: data) else {
                        return
                    }
                    
                    onCompleted()
                }
                
                
            case .failure(_):
                onError()
                return
            }
            
            
        }
        
        
        
    }
    
    func signup( onCompleted: @escaping () -> Void, onError: @escaping () -> Void ) {
        
        provider.request(.signup(signupRequest)) { response in
            switch response {
            case .success(let response):
                guard let result = try? JSONDecoder().decode(BaseResponse<Empty>.self, from: response.data) else {
                    onError()
                    return
                }
                
                if result.status == StatusCode.OK.rawValue {
                    
                    onCompleted()
                } else {
                    onError()
                }
                
                
            case .failure(_):
                onError()
                return
            }
            
            
        }
        
        
        
    }
}
