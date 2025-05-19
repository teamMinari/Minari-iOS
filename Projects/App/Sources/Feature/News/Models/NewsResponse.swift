struct NewsResponse: Decodable, Hashable {
    let title: String
    let url: String?
    let company: String?
    let thumbnail: String?
    let uploadTime: String?
        
}
