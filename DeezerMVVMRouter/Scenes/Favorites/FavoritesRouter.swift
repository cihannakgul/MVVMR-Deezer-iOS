//
//  FavoritesRouter.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 17.05.23.
//

import Foundation
import UIKit

final class FavoritesRouter {
    
    static func createFavoritesRouter() -> UINavigationController {
     //   let service = Service()
        let viewModel = FavoritesViewModel()
        let viewController = FavoritesViewController(viewModel: viewModel)
       // viewModel.routeDelegate = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
