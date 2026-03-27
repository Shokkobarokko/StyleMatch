import Foundation

enum StyleCategory: String, CaseIterable, Codable {
    case casual = "casual"
    case evening = "evening"
    case business = "business"
    case sport = "sport"
    case romantic = "romantic"
    case minimalism = "minimalism"
    
    var displayName: String {
        switch self {
        case .casual: return "Повседневный"
        case .evening: return "Вечерний"
        case .business: return "Деловой"
        case .sport: return "Спортивный"
        case .romantic: return "Романтичный"
        case .minimalism: return "Минимализм"
        }
    }
    
    /// Эмодзи для тегов — делает UI живее
    var emoji: String {
        switch self {
        case .casual: return "👕"
        case .evening: return "✨"
        case .business: return "💼"
        case .sport: return "🏃"
        case .romantic: return "🌸"
        case .minimalism: return "⬜"
        }
    }
    
    /// Цвет тега
    var color: String {
        switch self {
        case .casual: return "#7B9E87"
        case .evening: return "#9B72AA"
        case .business: return "#4A7FA5"
        case .sport: return "#E07B54"
        case .romantic: return "#C47B8A"
        case .minimalism: return "#8A8A8A"
        }
    }
}
