import SwiftUI
import Moya

final class HomeViewModel: ObservableObject {
    @Published var isSearched: Bool = false
    
    @Published var keywordRequest = TermsKeywordRequest()
    
    @Published var todayTermResponses: [TermsResponse]? = nil
    @Published var todayTermIndex: Int = 0
    
    @Published var keywordResponses: [TermsResponse]? = nil
    @Published var keywordItem: TermsResponse? = nil
    
    @Published var isSearchRemaining: Bool = false
    
    @Published var isMoreExplain: Bool = false
    
    @Published var reviewText: String? = nil
    @Published var reviewRemaining: Bool = false
    
    @Published var isBlankContent: Bool = false
    
    let provider = MoyaProvider<TermsService>(session: .init(interceptor: CFDInterceptor.shared))
    
    let aiProvider = MoyaProvider<AIChatService>(session: .init(interceptor: CFDInterceptor.shared))
    
    func keywordReset() {
        keywordResponses = nil
        keywordItem = nil
        isMoreExplain = false
        reviewText = nil
        reviewRemaining = false
        isBlankContent = false
    }
    
    func getTodayTerm() {
        
        provider.request(.get(.init(page: Int.random(in: 0..<10)))) { response in
            switch response {
            case .success(let response):
                guard let result = try? JSONDecoder().decode(BaseResponse<[TermsResponse]>.self, from: response.data) else {
                    return
                }
                
                guard let data = result.data else {
                    return
                }
                
                self.todayTermResponses = data
                
                
            case .failure:
                return
            }
        }
    }

    func searchKeyword( onComplete: @escaping () -> () ) {
        if keywordRequest.keyword.isEmpty { return }
        
        isSearchRemaining = true
        keywordReset()
        
        provider.request(.search(keywordRequest)) { response in
            switch response {
            case .success(let response):
                guard let result = try? JSONDecoder().decode(BaseResponse<[TermsResponse]>.self, from: response.data) else {
                    self.isSearchRemaining = false
                    return
                }

                guard let data = result.data else {
                    self.isSearchRemaining = false
                    return
                }
                
                
                if data.count <= 1 {
                    if !data.isEmpty {
                        self.keywordItem = data.first
                        self.isSearched = true
                        
                    } else {
                        self.isBlankContent = true
                        self.isSearched = true
                    }
                    
                    self.isSearchRemaining = false
                    onComplete()

                   
                } else {
                    self.keywordResponses = data
                }
                
                
                                
            case .failure:
                self.isSearchRemaining = false
                return
            }
        }
    }
    
    func getTermsById(id: Int, onComplete: @escaping () -> ()) {
        isSearchRemaining = true

        provider.request(.getById(.init(termId: id))) { response in
            switch response {
            case .success(let response):
                
                guard let result = try? JSONDecoder().decode(BaseResponse<TermsResponse>.self, from: response.data) else {
                    return
                }

               
                guard let data = result.data else {
                    return
                }
                
                
                self.keywordItem = data
                self.keywordRequest.keyword = data.termNm
                
                self.isSearched = true
                onComplete()
                
                self.isSearchRemaining = false
                
            case .failure:
                return
            }
            
            
        }
        
    }
    
    
    func reviewByAI(term: String) {
        let question = "\(term)이란? 쉬운 용어로 풀이해줘. 풀이만 적어줘"
        reviewRemaining = true
        
        aiProvider.request(.chat(.init(question: question))) { response in
            switch response {
            case .success(let response):
                guard let result = try? JSONDecoder().decode(ChatResponse.self, from: response.data) else {
                    return
                }

               
                guard let data = result.choices.first?.message.content else {
                    return
                }
                
                self.reviewText = data
                
            case .failure:
                return
            }
            
        }
    }
    
}
