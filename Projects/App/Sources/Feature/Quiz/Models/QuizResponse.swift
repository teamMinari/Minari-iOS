struct QuizResponse: Decodable {
    let qtContents: String
    let qtAnswer: Bool
    let qtCmt: String
    let qtTip: String
    let qtDifficulty: String
}
