import UIKit

enum RequestStatus: String, Codable {
    case pending = "pending"         // Отправлен, ждёт ответа стилиста
    case accepted = "accepted"       // Стилист принял заказ
    case inProgress = "inProgress"   // Стилист работает над подборкой
    case completed = "completed"     // Работа завершена
    case cancelled = "cancelled"     // Отменён
    
    var displayName: String {
        switch self {
        case .pending: return "Ожидает ответа"
        case .accepted: return "Принят"
        case .inProgress: return "В работе"
        case .completed: return "Завершён"
        case .cancelled: return "Отменён"
        }
    }
    
    var statusColor: UIColor {
        switch self {
        case .pending: return .smPending
        case .accepted: return .smGold
        case .inProgress: return UIColor(hex: "#4A7FA5")
        case .completed: return .smSuccess
        case .cancelled: return .smError
        }
    }
}
