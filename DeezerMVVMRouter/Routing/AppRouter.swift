//
//  AppRouter.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 13.05.23.
//

import Foundation
import UIKit

public final class AppRouter {
    
    var window: UIWindow?
    init() {}
    // swiftlint:disable all
    func startApplication() {
        guard let window = window else { fatalError("Window value cannot be nil") }
        let viewController = SplashRouter.createSplashScreen()
        window.rootViewController = viewController
    }
    
}
