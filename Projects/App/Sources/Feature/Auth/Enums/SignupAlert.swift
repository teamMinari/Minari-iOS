enum SignupAlert {
    case id, email, pw, pwconfirm, topic, job
    
    var message: String {
        switch self {
        case .id: "아이디가 입력되지 않았습니다."
        case .email: "이메일이 입력되지 않았습니다."
        case .pw: "비밀번호가 입력되지 않았습니다."
        case .pwconfirm: "비밀번호 확인이 일치하지 않습니다."
        case .topic: "관심사가 선택되지 않았습니다."
        case .job: "직업이 선택되지 않았습니다."
        }
    }
}
