struct ChatRequest: BaseRequest {
    var question: String = ""
    
    var params: [String : Any] {
        makeParams()
    }
}
