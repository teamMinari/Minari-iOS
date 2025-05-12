struct ProfileResponse: Decodable {
    let id: String
    let email: String
    let point: Int
    let exp: Int
    let authority: String?
    let title: String?
    let level: Int
    let checkLevel: Int
    let totalExp: Int
}
