//
//  SplashViewModel.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 13.05.23.
//

import Foundation
import Utilities

protocol SplashViewDataSource {
    var routeDelegate: SplashViewRouteDelegate? { get set }

}

protocol SplashViewRouteDelegate: AnyObject {
    func goToHomePage()
}

protocol SplashViewEventSource {
    var animationName: StringClosure? { get set }
}

protocol SplashViewProtocol: SplashViewDataSource, SplashViewEventSource {
    func viewDidLoad()
}

final class SplashViewModel: BaseViewModel, SplashViewProtocol {
    var animationName: StringClosure?
    // DataSource
    weak var routeDelegate: SplashViewRouteDelegate?
    
    func viewDidLoad() {
      animationName?("music")
    }
}
