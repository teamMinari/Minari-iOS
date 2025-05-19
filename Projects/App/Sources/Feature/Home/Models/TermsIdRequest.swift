struct TermsIdRequest: BaseRequest {
    var termId: Int
    
    var params: [String : Any] {
        makeParams()
    }
}
