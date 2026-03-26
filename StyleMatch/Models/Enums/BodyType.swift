import Foundation

enum BodyType: String, CaseIterable, Codable {
    // CaseIterable — чтобы можно было перебрать все варианты (нужно для Picker)
    
    case hourglass = "hourglass"
    case pear = "pear"
    case apple = "apple"
    case rectangle = "rectangle"
    case invertedTriangle = "invertedTriangle"
    
    var displayName: String {
        switch self {
        case .hourglass: return "Песочные часы"
        case .pear: return "Груша"
        case .apple: return "Яблоко"
        case .rectangle: return "Прямоугольник"
        case .invertedTriangle: return "Перевёрнутый треугольник"
        }
    }
    
    /// Описание для клиента — объясняем что это значит
    var description: String {
        switch self {
        case .hourglass: return "Плечи и бёдра одинаковой ширины, выраженная талия"
        case .pear: return "Бёдра шире плеч"
        case .apple: return "Объём в области живота"
        case .rectangle: return "Плечи, талия и бёдра примерно одинаковые"
        case .invertedTriangle: return "Плечи шире бёдер"
        }
    }
}
