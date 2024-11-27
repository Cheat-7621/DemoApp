//
//  SceneDelegate.swift
//  DemoApp
//
//  Created by Socheat YUONG on 10/11/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
      let window = UIWindow(windowScene: windowScene)
        
      let productListVC = ProductListViewController()
      let listNavController = UINavigationController(rootViewController: productListVC)
      listNavController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
      
      let productListVC2 = FavoritesViewController()
      let listNavController2 = UINavigationController(rootViewController: productListVC2)
      listNavController2.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "heart"), tag: 0)
      
      let productListVC3 = ShopsViewController()
      let listNavController3 = UINavigationController(rootViewController: productListVC3)
      listNavController3.tabBarItem = UITabBarItem(title: "Minus", image: UIImage(systemName: "cart"), tag: 0)
      
      let productListVC4 = ProfileViewController()
      let listNavController4 = UINavigationController(rootViewController: productListVC4)
      listNavController4.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 0)
      
      let productListVC5 = ProductDetailViewController()
      let listNavController5 = UINavigationController(rootViewController: productListVC5)
      listNavController5.tabBarItem = UITabBarItem(title: "Detail", image: UIImage(systemName: "cart.badge.plus"), tag: 0)
      
      let tabBarController = UITabBarController()
      tabBarController.viewControllers = [listNavController, listNavController2, listNavController3, listNavController4, listNavController5]
        
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }

}

