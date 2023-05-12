//
//  SplashRouter.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 13.05.23.
//

final class SplashRouter {

    static func createSplashScreen() -> SplashViewController {
        let viewModel = SplashViewModel()
        let viewController = SplashViewController(viewModel: viewModel)
        viewModel.routeDelegate = viewController
        return viewController
    }
}
