import SwiftUI

struct SavedTopic: Codable {
    var topic: String? = nil
    var job: String? = nil
    
    func encode() -> Data? {
           let encoder = JSONEncoder()
           
           if let encoded = try? encoder.encode(self) {
               return encoded
           } else {
               return nil
           }
       }
       
    static func decode(_ data: Data) -> SavedTopic? {
           let decoder = JSONDecoder()
           
           if let topic = try? decoder.decode(SavedTopic.self, from: data) {
               return topic
           } else {
               return nil
           }
       }
}
