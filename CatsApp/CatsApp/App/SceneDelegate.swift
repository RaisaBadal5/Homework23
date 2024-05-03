//
//  SceneDelegate.swift
//  CatsApp
//
//  Created by Default on 03.05.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let mainCoordinator = MainCoordinatorDelegate()
        let mainViewController = ViewController(coordinator: mainCoordinator)
        let navigation = UINavigationController(rootViewController: mainViewController)
        
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}


