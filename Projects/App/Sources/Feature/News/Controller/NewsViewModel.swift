import SwiftUI
import Moya

class NewsViewModel: ObservableObject {
    @Published var newsList = [NewsResponse]()
    @Published var hotNewsList = [NewsResponse]()
    
    @Published var currentCategory: CFDCategory = .finance
    
    @Published var selectedIndex: Int = 0
    
    let provider = MoyaProvider<NewsService>(session: .init(interceptor: CFDInterceptor.shared))
    
    func fetchHotnews() {
        provider.request(.get(.init(category: CFDCategory.hotnews.rawValue))) { response in
            switch response {
            case .success(let response):
                guard let result = try? JSONDecoder().decode(BaseResponse<[NewsResponse]>.self, from: response.data) else {
                    return
                }
                
                guard let data = result.data else {
                    return
                }
                
                
                self.hotNewsList = data[..<3].shuffled()
                
            case .failure(_):
                return
            }
            
            
        }
    }
    
    func fetchNews() {
        provider.request(.get(.init(category: currentCategory.rawValue))) { response in
            switch response {
            case .success(let response):
                guard let result = try? JSONDecoder().decode(BaseResponse<[NewsResponse]>.self, from: response.data) else {
                    return
                }
                
                guard let data = result.data else {
                    return
                }
                
                self.newsList = data
                
                
            case .failure(_):
                return
            }
            
            
        }
        
            
    }
}
