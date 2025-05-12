import SwiftUI

struct BaseResponse<Model: Decodable>: Decodable {
    let status: Int
    let message: String
    let data: Model?
}
