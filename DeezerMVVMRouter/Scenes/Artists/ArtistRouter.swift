//
//  ArtistRouter.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 14.06.23.
//

import DataProvider
import UIComponents

final class ArtistRouter {
    
    static func create(genre: CategoriesCellProtocol) -> ArtistViewController {
        let service = Service()
        let viewModel = ArtistViewModel(genre:genre, service: service)
        let viewController = ArtistViewController(viewModel: viewModel)
        viewModel.routeDelegate = viewController
        return viewController
    }
    
}
