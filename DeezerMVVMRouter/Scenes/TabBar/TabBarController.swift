//
//  TabBarController.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 17.05.23.
//

import Foundation
import UIKit
import Kingfisher
import Utilities
import DataProvider
class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        let musicViewController = createMusicCategories()
        let favoritesViewController = createFavoritesViewController()
        viewControllers = [musicViewController, favoritesViewController]
        configureContents()

    }
    
  
    private func configureContents() {
        tabBar.tintColor = UIColor.red
        tabBar.isTranslucent = false
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance

    }
    private func createMusicCategories() -> UINavigationController {
        let service = Service()
        let musicRouter = MusicCategoriesRouter()
        let musicViewModel = MusicCategoriesViewModel(service: service)
        let musicViewController = MusicCategoriesViewController(viewModel: musicViewModel)
        musicViewModel.routeDelegate = musicViewController
        let navigationController = UINavigationController(rootViewController: musicViewController)
        let musicIconImage = navItemImage(imageString: "musicIcon")
        navigationController.tabBarItem.image = musicIconImage
        navigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)

        return navigationController
    }
    
    private func navItemImage(imageString: String) -> UIImage {
        guard let icon = UIImage(named:imageString) else { return UIImage() }
        guard let resizeImage = icon.resizeImage(image: icon, targetSize: CGSize(width: 30, height: 30)) else { return UIImage() }
        return resizeImage
            
    }
    
    private func createFavoritesViewController() -> UINavigationController {
        let favoritesRouter = FavoritesRouter()
        let favoritesViewModel = FavoritesViewModel()
        let favoritesViewController = FavoritesViewController(viewModel: favoritesViewModel)
        let navigationController = UINavigationController(rootViewController: favoritesViewController)
        let likeIcon = navItemImage(imageString: "like")
        navigationController.tabBarItem.image = likeIcon
        navigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)

        return navigationController
    }
    
}
