//
//  SplashViewController.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 13.05.23.

import UIKit
import Lottie
final class SplashViewController: BaseViewController<SplashViewModel> {

    var animationView : LottieAnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        subscribeViewModel()
        viewModel.viewDidLoad()
        configAnimation()
        addSubViews()

    }
}
// MARK: - SubscribeViewModel
extension SplashViewController {
    
    private func subscribeViewModel() {
        viewModel.animationName = { [weak self] name in
            guard let self = self else { return }
            self.animationView = .init(name: name)
        }
    }
}

// MARK: - AddSubview

extension SplashViewController {
    private func addSubViews() {
        guard let animationView = animationView else { return }
        view.addSubview(animationView)
        animationView.play()
    }
}

extension SplashViewController {
    private func configAnimation() {
        animationView?.frame = view.bounds
        animationView?.contentMode = .scaleAspectFit
        animationView?.animationSpeed = 0.5
    }
}

// MARK: - RoutingDelegate
extension SplashViewController: SplashViewRouteDelegate {
    
    func goToHomePage() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
//                  // go other page
//                }
//        guard let window = app.router.window else { return }
//        let homeViewController = HomeRouter.createHomeScreen()
//        UIView.transition(with: window, duration: 1, options: .transitionFlipFromBottom, animations: {
//            UIView.performWithoutAnimation {
//                window.rootViewController = homeViewController
//            }
//        }, completion: nil)
    }
}
