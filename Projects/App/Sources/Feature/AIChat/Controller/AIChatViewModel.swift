import SwiftUI
import Moya

class AIChatViewModel: ObservableObject {
    @Published var chatRequest = ChatRequest()
    @Published var messages: [Message] = .init()
    
    @Published var isMessageRemaining: Bool = false
    
    let provider = MoyaProvider<AIChatService>(session: .init(interceptor: CFDInterceptor.shared))
    
    func fetchMessages() {
        if isMessageRemaining { return }
        
        isMessageRemaining = true
        
        let question = chatRequest.question
        
        chatRequest.question = ""
        
        
        messages.append(.init(text: question, type: .me))
        
        
        messages.append(.init(text: "더 나은 설명을 하기 위해 고민중", type: .ai))
        
        provider.request(.chat(.init(question: question))) { response in
            switch response {
            case .success(let response):
                guard let result = try? JSONDecoder().decode(ChatResponse.self, from: response.data) else {
                    self.messages.remove(at: self.messages.count - 1)
                    self.isMessageRemaining = false
                    
                    return
                }
                
                guard let data = result.choices.first?.message.content else {
                    self.messages.remove(at: self.messages.count - 1)
                    self.isMessageRemaining = false
                    
                    return
                }
                
                self.messages.remove(at: self.messages.count - 1)
                self.messages.append(.init(text: data, type: .ai))
                
                self.isMessageRemaining = false
                
            case .failure:
                self.isMessageRemaining = false
                return
            }
            
        }
        
        
        
    }
}
