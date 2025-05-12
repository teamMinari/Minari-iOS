import SwiftUI

enum StatusCode: Int {
    case OK = 200, Created, Accepted
    
    case BadRequest = 400, Unauthorized, PaymentRequired, Forbidden, NonFound, MethodNotAllowed, Conflict = 409
    
    case ServerError = 500
}
