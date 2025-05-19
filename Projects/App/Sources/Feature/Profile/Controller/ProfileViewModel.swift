import SwiftUI
import Alamofire
import Moya

class ProfileViewModel: ObservableObject {
    @Published var isSignoutPresented: Bool = false
    
    @Published var response: ProfileResponse? = nil
    
    @Published var topics: [Topic] = [.init(name: "10대"), .init(name: "20대"), .init(name: "30대"), .init(name: "40대")]
    
    @Published var savedTopic: SavedTopic = .init(job: "직장인")
    
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
    

    func getExpNextLevel(level: Int) -> Int {
        return (level + 1) * 100
    }
    
    func nextLevelProgress() -> Double {
        guard let response = response else { return 0 }
        
        let expThisLevelStart = (1..<response.level).reduce(0) { $0 + $1 * 100 }
        let expNextLevel = getExpNextLevel(level: response.level)
        let progress = Double(response.exp - expThisLevelStart) / Double(expNextLevel)
        
        
        
        return max(0, min(1, progress))
    }
    
    func giveExp(exp: Int) {
        provider.request(.giveExp(.init(expToAdd: exp))) { response in
            switch response {
            case .success(let response):
                print(response.statusCode)
                
                guard let result = try? JSONDecoder().decode(BaseResponse<Empty>.self, from: response.data) else {
                    return
                }
                
                print(result)
                
                return
            case .failure:
                return
            }
        }
    }

    
    func givePoint(point: Int, completion: @escaping () -> ()) {
        provider.request(.givePoint(.init(pointToAdd: point))) { response in
            switch response {
            case .success(let response):
                completion()
                
                return
            case .failure:
                return
            }
        }
    }
}
