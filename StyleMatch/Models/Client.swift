import Foundation

struct Client: Codable {
    let userId: String
    var name: String
    var age: Int
    var height: Int        
    var weight: Int
    var bodyType: BodyType
    var stylePreferences: [StyleCategory]
    var budgetMin: Double
    var budgetMax: Double
    var avatarImageData: Data?
    var favoriteStylists: [String]
    var savedLooks: [String]
    var city: String
    
    init(userId: String, name: String, age: Int, height: Int, weight: Int,
         bodyType: BodyType, stylePreferences: [StyleCategory],
         budgetMin: Double, budgetMax: Double, city: String,
         avatarImageData: Data? = nil, favoriteStylists: [String] = [],
         savedLooks: [String] = []) {
        self.userId = userId
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
        self.bodyType = bodyType
        self.stylePreferences = stylePreferences
        self.budgetMin = budgetMin
        self.budgetMax = budgetMax
        self.city = city
        self.avatarImageData = avatarImageData
        self.favoriteStylists = favoriteStylists
        self.savedLooks = savedLooks
    }
}
