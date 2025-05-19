struct TermsKeywordRequest: BaseRequest {
    var keyword: String = ""
    
    var params: [String : Any] {
        makeParams()
    }
}
