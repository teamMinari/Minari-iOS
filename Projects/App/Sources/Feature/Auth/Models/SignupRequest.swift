struct SignupRequest: BaseRequest {
    var id: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var email: String = ""
    
    var params: [String: Any] {
        self.makeParams(excluding: ["confirmPassword"])
    }
    
    var isPasswordValid: Bool {
        password == confirmPassword
    }
}
