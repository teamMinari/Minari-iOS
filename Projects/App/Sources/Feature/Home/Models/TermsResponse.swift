import Foundation

struct TermsResponse: Codable, Hashable {
    let termId: Int
    let termNm: String
    let termExplain: String
    let termDifficulty: String
    let termLike: Bool?
   
}


