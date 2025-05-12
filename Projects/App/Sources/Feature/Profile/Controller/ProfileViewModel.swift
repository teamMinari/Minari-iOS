import SwiftUI
import Moya

class ProfileViewModel: ObservableObject {
    @Published var isSignoutPresented: Bool = false
    
    @Published var response: ProfileResponse? = nil
    
    let provider = MoyaProvider<ProfileService>(session: .init(interceptor: CFDInterceptor.shared))

    func getProfile() {
        provider.request(.get) { response in
            switch response {
            case .success(let response):
                print(response)
                
                guard let result = try? JSONDecoder().decode(ProfileResponse.self, from: response.data) else {
                    print("오류")
                    return
                }
                
                self.response = result
                
                return
            case .failure:
                return
            }
        }
    }
}
