struct ChatResponse: Decodable {
    let choices: [MessageResponse]
}


struct MessageResponse: Decodable {
    let message: MessageContentResponse
}


struct MessageContentResponse: Decodable {
    let role: String
    let content: String
}
