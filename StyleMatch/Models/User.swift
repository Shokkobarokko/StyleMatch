import Foundation

struct User: Codable {
    let id: String
    var email: String
    var passwordHash: String
    let role: UserRole
    var createdAt: Date
    
    init(id: String = UUID().uuidString, email: String, passwordHash: String, role: UserRole, createdAt: Date = Date()) {
        self.id = id
        self.email = email
        self.passwordHash = passwordHash
        self.role = role
        self.createdAt = createdAt
    }
}
