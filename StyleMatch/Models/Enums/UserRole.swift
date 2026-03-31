import Foundation

enum UserRole: String, Codable {
    case client = "client"
    case stylist = "stylist"
    
    var displayName: String {
        switch self {
        case .client:
            return "Клиент"
        case .stylist:
            return "Стилист"
        }
    }
}
