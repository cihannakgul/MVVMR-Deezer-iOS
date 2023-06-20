//
//  TabBarRoute.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 17.05.23.
//

import Foundation
import UIKit

final class TabBarRouter {


        static func createTabBar() -> UINavigationController {
            let tabBarController = TabBarController()
            tabBarController.tabBar.isTranslucent = true
            tabBarController.tabBar.barTintColor = .yellow
            let navigationController = UINavigationController(rootViewController: tabBarController)            
            return navigationController
        }
   
}
