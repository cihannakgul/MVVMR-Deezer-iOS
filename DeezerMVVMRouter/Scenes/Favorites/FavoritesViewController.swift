//
//  FavoritesViewController.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 17.05.23.
//

import Foundation
final class FavoritesViewController: BaseViewController<FavoritesViewModel> {
    private var titleName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        subscribeViewModel()
        viewModel.viewDidLoad()
        configureContents()
    }
}

// MARK: - SubscribeViewModel
extension FavoritesViewController {
    
    private func subscribeViewModel() {
        viewModel.titleName = { [weak self] name in
            guard let self = self else { return }
            self.titleName = name
        }
    }
}

extension FavoritesViewController {
    private func configureContents() {
        view.backgroundColor = .white
        guard let title = titleName else { return }
        navigationControllerConfig(titleName: title)
    }
}
