import SwiftUI
import Moya

class QuizViewModel: ObservableObject {
    
    @Published var quizIndex: Int = 0
    @Published var quizs: [QuizResponse] = []
    
    @Published var lastPoint: Int = 0
    @Published var addingPoint: Int = 0
    
    @Published var selectedAnswer: QuizIngameButtonType? = nil
    
    @Published var isShowingTip: Bool = false
    
    @Published var isAnswered: Bool = false
    @Published var isFinished: Bool = false
    
    @Published var answerCount: Int = 0
    
    @Published var isTotallyFinished: Bool = false
    
    
    var currentQuiz: QuizResponse? { if quizs.isEmpty { return nil } else { return quizs[quizIndex] } }
    
    let provider = MoyaProvider<QuizService>(session: .init(interceptor: CFDInterceptor.shared))
    
    func resetQuiz() {
        quizIndex = 0
        quizs = []
        lastPoint = 0
        selectedAnswer = nil
        isAnswered = false
        isFinished = false
        isTotallyFinished = false
    }
    
    func nextQuiz() {
        if (quizIndex + 1) >= quizs.count {
            isTotallyFinished = true
            return
        }
    
        var point: Double = 100
        
        if !isAnswered {
            point -= (point / 2)
        }
        
        if isShowingTip {
            point *= 0.6
        }
        
        addingPoint += Int(point)
        
        selectedAnswer = nil
        isAnswered = false
        isFinished = false
        isShowingTip = false
        quizIndex += 1
    }
    
    func answer(_ answer: Bool) {
        guard let quiz = currentQuiz else { return }
            
        selectedAnswer = answer ? .yes : .no
        
        isAnswered = answer == quiz.qtAnswer
        
        if isAnswered {
            answerCount += 1
        }
        
        isFinished = true

    }
    
    func getQuiz() {
        provider.request(.get) { response in
            switch response {
            case .success(let response):
                guard let result = try? JSONDecoder().decode(BaseResponse<[QuizResponse]>.self, from: response.data) else {
                    print("오류")
                    return
                }
                
                guard let data = result.data else { return }
                
                self.quizs = self.sortQuiz(items: data)
                
                return
            case .failure:
                return
            }
        }
    }
    
    
    func sortQuiz(items: [QuizResponse]) -> [QuizResponse] {
        var sortedItems: [QuizResponse] = []
        
        for _ in 0..<10 {
            if let item = items.randomElement() {
                sortedItems.append(item)
            }
        }
        
        return sortedItems
    }
    
}
