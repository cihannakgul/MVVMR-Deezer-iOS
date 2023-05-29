//
//  BaseViewController.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 13.05.23.
//

import Foundation
import UIKit
import UIComponents
class BaseViewController<V: BaseViewModelProtocol>: UIViewController {
 
    var viewModel: V

    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        subscribeLoading()
    }

    private func configureContents() {
        self.tabBarController?.tabBar.isTranslucent = true
        view.backgroundColor = .white
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

#if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
#endif
}

// MARK: - Loading
extension BaseViewController {

    private func subscribeLoading() {
        viewModel.showLoading = {  [weak self] in
            guard let self = self else { return }
            let loadingView = LoadingView()
            loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            loadingView.frame = self.view.bounds
            self.view.addSubview(loadingView)
        }
        viewModel.hideLoading = {  [weak self] in
            guard let self = self else { return }
            self.view.subviews.filter({ $0 is LoadingView }).forEach({ $0.removeFromSuperview() })
        }
    }
}
// MARK: - Base Navigation Controller
extension BaseViewController {
    func navigationControllerConfig(titleName: String) {
        
        guard let navigationController = navigationController,
            let flareGradientImage = CAGradientLayer.primaryGradient(on: navigationController.navigationBar)
            else {
                print("Error creating gradient color!")
                return
            }
        navigationItem.title = titleName
        navigationController.navigationBar.isTranslucent = false
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(patternImage: flareGradientImage)
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = textAttributes
        appearance.largeTitleTextAttributes = textAttributes
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        
        
//        var gradient: CAGradientLayer = {
//           let gradient = CAGradientLayer()
//           gradient.type = .axial
//           gradient.colors = [
//               UIColor.red.cgColor,
//               UIColor.purple.cgColor,
//               UIColor.cyan.cgColor
//           ]
//           gradient.locations = [0, 0.25, 1]
//           return gradient
//       }()

 

//        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = UIColor.orange
//        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        appearance.titleTextAttributes = textAttributes
//        appearance.largeTitleTextAttributes = textAttributes
//        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.standardAppearance = appearance
//        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    

}

