import UIKit

extension UIColor {
    //MARK: Основные цвета (Brand colors)
    static let smCharcoal = UIColor(hex: "#1A1A1A")
    static let smCream = UIColor(hex: "#FAF7F2")
    static let smGold = UIColor(hex: "#C9A84C")
    static let smGoldLight = UIColor(hex: "#E8C97A")
    static let DustyRose = UIColor(hex: "#C4956A")
    static let smGray = UIColor(hex: "#8A8A8A")
    static let smLightGray = UIColor(hex: "#E5E0D8")
    static let smCardBackground = UIColor(hex: "#F0EBE3")
    
    //MARK: Семантические цвета
    static var smBackGround: UIColor {
        return UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? .smCharcoal : .smCream
            
        }
    }
    static var smPrimaryText: UIColor {
        return UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? .smCream: .smCharcoal
        }
    }
    static var smCard: UIColor {
        return UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ?UIColor(hex: "#2A2A2A"):.smBackGround
        }
    }
    
    //MARK: Статусные цвета
    static let smSuccess = UIColor(hex: "#4CAF7C")
    static let smPending = UIColor(hex: "#E8A838")
    static let smError = UIColor(hex: "#E85454")
    
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
