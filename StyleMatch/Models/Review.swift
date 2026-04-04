import Foundation

struct Review: Codable {
    let id: String
    let clientId: String
    let stylistId: String
    let requestId: String
    var rating: Int
    var comment: String
    var createdAt: Date
    var clientName: String
    
    init(id: String = UUID().uuidString, clientId: String, stylistId: String,
         requestId: String, rating: Int, comment: String, createdAt: Date = Date(),
         clientName: String) {
        self.id = id
        self.clientId = clientId
        self.stylistId = stylistId
        self.requestId = requestId
        self.rating = rating
        self.comment = comment
        self.createdAt = createdAt
        self.clientName = clientName
    }
}
