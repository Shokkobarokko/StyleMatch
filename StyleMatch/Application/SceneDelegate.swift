import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//       
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        
//        let window = UIWindow(windowScene: windowScene)
        
//Код для проверки стилей и шрифтов
//        let testVC = UIViewController()
//        testVC.view.backgroundColor = .smBackGround
//        
//        let label = UILabel()
//        label.text = "StyleMatch"
//        label.font = .smLargeTitle
//        label.textColor = .smPrimaryText
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        testVC.view.addSubview(label)
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: testVC.view.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: testVC.view.centerYAnchor)
//        ])
        
//Код для проверки Enums
//        let testVC = UIViewController()
//        testVC.view.backgroundColor = .smBackGround
//        
//        let textView = UITextView()
//        textView.font = .smBody
//        textView.textColor = .smPrimaryText
//        textView.backgroundColor = .clear
//        textView.isEditable = false
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        
//        var infoText = "ПРОВЕРКА ЭНУМОВ:\n\n"
//            
//            infoText += "=== UserRole ===\n"
//            infoText += "client: \(UserRole.client.displayName)\n"
//            infoText += "stylist: \(UserRole.stylist.displayName)\n\n"
//            
//            infoText += "=== BodyType (все варианты) ===\n"
//            for type in BodyType.allCases {
//                infoText += "\(type.rawValue): \(type.displayName)\n"
//            }
//            infoText += "\n"
//            
//            infoText += "=== StyleCategory (все варианты) ===\n"
//            for category in StyleCategory.allCases {
//                infoText += "\(category.emoji) \(category.displayName)\n"
//            }
//            infoText += "\n"
//            
//            infoText += "=== RequestStatus ===\n"
//            infoText += "pending: \(RequestStatus.pending.displayName) - цвет: \(RequestStatus.pending.statusColor)\n"
//            infoText += "accepted: \(RequestStatus.accepted.displayName)\n"
//            infoText += "completed: \(RequestStatus.completed.displayName)\n"
//            
//            textView.text = infoText
//            
//            testVC.view.addSubview(textView)
//            NSLayoutConstraint.activate([
//                textView.topAnchor.constraint(equalTo: testVC.view.safeAreaLayoutGuide.topAnchor, constant: 20),
//                textView.leadingAnchor.constraint(equalTo: testVC.view.leadingAnchor, constant: 20),
//                textView.trailingAnchor.constraint(equalTo: testVC.view.trailingAnchor, constant: -20),
//                textView.bottomAnchor.constraint(equalTo: testVC.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
//            ])
//            
//            print("=== UserRole ===")
//            print("Клиент: \(UserRole.client.displayName)")
//            print("Стилист: \(UserRole.stylist.displayName)")
//            
//            print("\n=== StyleCategory (все категории с эмодзи) ===")
//            StyleCategory.allCases.forEach { category in
//                print("\(category.emoji) \(category.displayName)")
//            }
//            
//        
//        
//        
//        let temporaryViewController = UIViewController()
//        temporaryViewController.view.backgroundColor = .white
//        temporaryViewController.title = "StyleMatch"
//        
//        window.rootViewController = UINavigationController(rootViewController: testVC)
//        self.window = window
//        window.makeKeyAndVisible()
//    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        // ВРЕМЕННЫЙ КОД ДЛЯ ПРОВЕРКИ МОДЕЛЕЙ
        let testVC = UIViewController()
        testVC.view.backgroundColor = .smBackground
        
        let textView = UITextView()
        textView.font = .smCaption
        textView.textColor = .smPrimaryText
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        // Тестируем создание стилиста
        let testStylist = Stylist(
            userId: "test123",
            name: "Анна Иванова",
            city: "Москва",
            experience: 5,
            specializations: [.casual, .evening],
            consultationPrice: 3000,
            description: "Профессиональный стилист с 5-летним опытом",
            isVerified: true
        )
        
        // Тестируем создание клиента
        let testClient = Client(
            userId: "client456",
            name: "Мария Петрова",
            age: 28,
            height: 165,
            weight: 55,
            bodyType: .hourglass,
            stylePreferences: [.casual, .romantic],
            budgetMin: 5000,
            budgetMax: 20000,
            city: "Санкт-Петербург"
        )
        
        var infoText = "ПРОВЕРКА МОДЕЛЕЙ ДАННЫХ:\n\n"
        infoText += "=== Стилист ===\n"
        infoText += "Имя: \(testStylist.name)\n"
        infoText += "Город: \(testStylist.city)\n"
        infoText += "Цена: \(testStylist.priceString)\n"
        infoText += "Рейтинг: \(testStylist.ratingString)\n"
        infoText += "Верифицирован: \(testStylist.isVerified ? "✓ Да" : "Нет")\n\n"
        
        infoText += "=== Клиент ===\n"
        infoText += "Имя: \(testClient.name)\n"
        infoText += "Возраст: \(testClient.age)\n"
        infoText += "Тип фигуры: \(testClient.bodyType.displayName)\n"
        infoText += "Бюджет: \(Int(testClient.budgetMin)) - \(Int(testClient.budgetMax)) ₽\n"
        
        textView.text = infoText
        
        // Вывод в консоль
        print("=== ПРОВЕРКА МОДЕЛЕЙ ===")
        print("Стилист: \(testStylist.name), цена: \(testStylist.priceString)")
        print("Клиент: \(testClient.name), бюджет: \(testClient.budgetMin)-\(testClient.budgetMax)")
        print("✅ Все модели успешно созданы и работают!")
        
        testVC.view.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: testVC.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: testVC.view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: testVC.view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: testVC.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        window.rootViewController = UINavigationController(rootViewController: testVC)
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

