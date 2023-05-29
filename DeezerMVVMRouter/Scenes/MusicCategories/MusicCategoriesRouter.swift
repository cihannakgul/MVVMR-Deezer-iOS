//
//  MusicCategoriesRouter.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 13.05.23.
//

import Foundation
import UIKit
import DataProvider
final class MusicCategoriesRouter {


        static func createMusicCategoriesRouter() -> UINavigationController {
           let service = Service()
            let viewModel = MusicCategoriesViewModel(service: service)
            let viewController = MusicCategoriesViewController(viewModel: viewModel)
            viewModel.routeDelegate = viewController
            let navigationController = UINavigationController(rootViewController: viewController)
            return navigationController
        }
   
}
