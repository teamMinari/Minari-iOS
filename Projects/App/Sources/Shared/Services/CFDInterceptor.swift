import SwiftUI
import Alamofire
import Moya

final class CFDInterceptor: RequestInterceptor {
    static let shared = CFDInterceptor()
    
    private init() { }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        guard urlRequest.url?.absoluteString.hasPrefix(Bundle.main.url) == true,
              let keychain = KeyChain.read()
        else {
            completion(.success(urlRequest))
            return
        }
        
        var urlRequest = urlRequest
        
        urlRequest.setValue(keychain.accessToken, forHTTPHeaderField: "Authorization")
        
        completion(.success(urlRequest))
    }
    
    
    func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        let provider = MoyaProvider<AuthService>()
        
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401
        else {
            
            completion(.doNotRetryWithError(error))
            return
        }
        
        guard let keychain = KeyChain.read()
        else {
            completion(.doNotRetry)
            return
        }
        
        let rootVM = RootViewModel.shared
        
        
        provider.request(.refresh(.init(refreshToken: keychain.refreshToken))) { result in
            switch result {
            case .success(let response):
                if let decodedData = try? JSONDecoder().decode(BaseResponse<SigninResponse>.self, from: response.data) {
                    
                    guard let data = decodedData.data else {
                        return
                    }
                    
                    if KeyChain.update(token: .init(accessToken: data.accessToken, refreshToken: keychain.refreshToken)) {
                        rootVM.objectWillChange.send()
                        completion(.retry)
                    }
                    
                    
                    else {
                        if KeyChain.delete() {
                            rootVM.objectWillChange.send()
                            completion(.doNotRetry)
                        }
                        

                    }
                }
            case .failure(_):
                if KeyChain.delete() {
                    rootVM.objectWillChange.send()
                }
                
                completion(.doNotRetryWithError(error))
                
            }
        }
        
        
        
        
    }
}
