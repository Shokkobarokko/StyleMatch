import Foundation

final class LocalDataManager {
    
    // MARK: - Singleton
    static let shared = LocalDataManager()
    private init() {}
    
    // MARK: - Ключи для UserDefaults
   
    private enum Keys {
        static let currentUser = "current_user"
        static let currentClient = "current_client"
        static let currentStylist = "current_stylist"
        static let isLoggedIn = "is_logged_in"
        static let allUsers = "all_users"
        static let allStylists = "all_stylists"
        static let allLooks = "all_looks"
        static let allRequests = "all_requests"
        static let allReviews = "all_reviews"
    }
    
    private let defaults = UserDefaults.standard
    
    // MARK: - Авторизация
    
    var isLoggedIn: Bool {
        get { defaults.bool(forKey: Keys.isLoggedIn) }
        set { defaults.set(newValue, forKey: Keys.isLoggedIn) }
    }
    
    // MARK: - Текущий пользователь
    
    var currentUser: User? {
        get {

            guard let data = defaults.data(forKey: Keys.currentUser) else { return nil }
            return try? JSONDecoder().decode(User.self, from: data)
        }
        set {

            if let user = newValue {
                let data = try? JSONEncoder().encode(user)
                defaults.set(data, forKey: Keys.currentUser)
            } else {
                defaults.removeObject(forKey: Keys.currentUser)
            }
        }
    }
    
    var currentClient: Client? {
        get {
            guard let data = defaults.data(forKey: Keys.currentClient) else { return nil }
            return try? JSONDecoder().decode(Client.self, from: data)
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            defaults.set(data, forKey: Keys.currentClient)
        }
    }
    
    var currentStylist: Stylist? {
        get {
            guard let data = defaults.data(forKey: Keys.currentStylist) else { return nil }
            return try? JSONDecoder().decode(Stylist.self, from: data)
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            defaults.set(data, forKey: Keys.currentStylist)
        }
    }
    
    // MARK: - Список всех стилистов
    
    var allStylists: [Stylist] {
        get {
            guard let data = defaults.data(forKey: Keys.allStylists) else { return [] }
            return (try? JSONDecoder().decode([Stylist].self, from: data)) ?? []
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            defaults.set(data, forKey: Keys.allStylists)
        }
    }
    
    // MARK: - Образы (Looks)
    
    var allLooks: [Look] {
        get {
            guard let data = defaults.data(forKey: Keys.allLooks) else { return [] }
            return (try? JSONDecoder().decode([Look].self, from: data)) ?? []
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            defaults.set(data, forKey: Keys.allLooks)
        }
    }
    
    // MARK: - Запросы (Requests)
    
    var allRequests: [Request] {
        get {
            guard let data = defaults.data(forKey: Keys.allRequests) else { return [] }
            return (try? JSONDecoder().decode([Request].self, from: data)) ?? []
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            defaults.set(data, forKey: Keys.allRequests)
        }
    }
    
    // MARK: - Отзывы
    
    var allReviews: [Review] {
        get {
            guard let data = defaults.data(forKey: Keys.allReviews) else { return [] }
            return (try? JSONDecoder().decode([Review].self, from: data)) ?? []
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            defaults.set(data, forKey: Keys.allReviews)
        }
    }
    
    // MARK: - Все зарегистрированные пользователи
    
    var allUsers: [User] {
        get {
            guard let data = defaults.data(forKey: Keys.allUsers) else { return [] }
            return (try? JSONDecoder().decode([User].self, from: data)) ?? []
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            defaults.set(data, forKey: Keys.allUsers)
        }
    }
    
    // MARK: - Вспомогательные методы
    
    /// Полный выход из аккаунта — удаляем все данные сессии
    func logout() {
        isLoggedIn = false
        currentUser = nil
        currentClient = nil
        currentStylist = nil
    }
    
    /// Сохранить образ стилиста
    func saveLook(_ look: Look) {
        var looks = allLooks
        if let index = looks.firstIndex(where: { $0.id == look.id }) {
            looks[index] = look  // Обновляем существующий
        } else {
            looks.append(look)   // Добавляем новый
        }
        allLooks = looks
    }
    
    /// Получить образы конкретного стилиста
    func looks(forStylistId stylistId: String) -> [Look] {
        return allLooks.filter { $0.stylistId == stylistId && $0.isPublished }
    }
    
    /// Сохранить запрос
    func saveRequest(_ request: Request) {
        var requests = allRequests
        if let index = requests.firstIndex(where: { $0.id == request.id }) {
            requests[index] = request
        } else {
            requests.append(request)
        }
        allRequests = requests
    }
    

    func requests(forClientId clientId: String) -> [Request] {
        return allRequests.filter { $0.clientId == clientId }
    }
    

    func requests(forStylistId stylistId: String) -> [Request] {
        return allRequests.filter { $0.stylistId == stylistId }
    }
}
