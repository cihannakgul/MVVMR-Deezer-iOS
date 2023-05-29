//
//  FavoritesViewModel.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 17.05.23.
//

import Foundation
import Utilities

protocol FavoritesViewDataSource {}

protocol FavoritesViewEventSource {
    var titleName: StringClosure? { get set }

}

protocol FavoritesViewProtocol: FavoritesViewDataSource, FavoritesViewEventSource {}

final class FavoritesViewModel: BaseViewModel, FavoritesViewProtocol {
    var titleName: StringClosure?
    func viewDidLoad() {
        titleName?("Favorites")
    }
}
