import Foundation

final class AuthManager {
    
    static let shared = AuthManager()
    private init() {}
    
    private let dataManager = LocalDataManager.shared
    
    func registerClient(email: String, password: String, clientData: Client) -> String? {
        
        if dataManager.allUsers.contains(where: { $0.email == email }) {
            return "Пользователь с таким email уже существует"
        }
        
        let user = User(email: email, password: password, role: .client)
        
        var users = dataManager.allUsers
        users.append(user)
        dataManager.allUsers = users
        
        var updatedClient = clientData
        var finalClient = Client(userId: user.id, name: clientData.name)
        finalClient.age = clientData.age
        finalClient.height = clientData.height
        finalClient.weight = clientData.weight
        finalClient.bodyType = clientData.bodyType
        finalClient.stylePreferences = clientData.stylePreferences
        finalClient.budgetMin = clientData.budgetMin
        finalClient.budgetMax = clientData.budgetMax
        
        dataManager.currentUser = user
        dataManager.currentClient = finalClient
        dataManager.isLoggedIn = true
        
        return nil  
    }
    
    func registerStylist(email: String, password: String, stylistData: Stylist) -> String? {
        if dataManager.allUsers.contains(where: { $0.email == email }) {
            return "Пользователь с таким email уже существует"
        }
        
        let user = User(email: email, password: password, role: .stylist)
        
        var users = dataManager.allUsers
        users.append(user)
        dataManager.allUsers = users
        
        var finalStylist = Stylist(userId: user.id, name: stylistData.name)
        finalStylist.city = stylistData.city
        finalStylist.experience = stylistData.experience
        finalStylist.specializations = stylistData.specializations
        finalStylist.consultationPrice = stylistData.consultationPrice
        finalStylist.description = stylistData.description
        finalStylist.avatarImageData = stylistData.avatarImageData
        
        var stylists = dataManager.allStylists
        stylists.append(finalStylist)
        dataManager.allStylists = stylists
        
        dataManager.currentUser = user
        dataManager.currentStylist = finalStylist
        dataManager.isLoggedIn = true
        
        return nil
    }
    
    func login(email: String, password: String) -> String? {
        guard let user = dataManager.allUsers.first(where: {
            $0.email == email && $0.passwordHash == password
        }) else {
            return "Неверный email или пароль"
        }
        
        dataManager.currentUser = user
        dataManager.isLoggedIn = true
        
        switch user.role {
        case .client:
            break
        case .stylist:
            if let stylist = dataManager.allStylists.first(where: { $0.userId == user.id }) {
                dataManager.currentStylist = stylist
            }
        }
        
        return nil
    }
    
    func logout() {
        dataManager.logout()
    }
    
    var isLoggedIn: Bool { dataManager.isLoggedIn }
    var currentUser: User? { dataManager.currentUser }
    var currentRole: UserRole? { dataManager.currentUser?.role }
}

