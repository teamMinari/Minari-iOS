import SwiftUI
import Moya

class AuthViewModel: ObservableObject {
    @Published var isSavingToken: Bool = true
    
    @Published var signupRequest = SignupRequest()
    
    @Published var signinRequest = SigninRequest(id: "", password: "")
    
    @Published var googleLoginAlert: Bool = false
    
    @Published var signupAlertMessage: String = "오류가 발생했습니다"
    
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
}
