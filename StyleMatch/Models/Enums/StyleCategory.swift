import UIKit

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
    
    var color: UIColor {
        switch self {
        case .casual: 
            return .smDustyRose
        case .evening:
            return .smGold
        case .business:
            return .smCharcoal
        case .sport:
            return .smSuccess
        case .romantic:
            return .smDustyRose
        case .minimalism:
            return .smGray
        }
    }
}
