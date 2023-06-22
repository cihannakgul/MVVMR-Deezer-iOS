//
//  ArtistAlbumRouter.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 19.06.23.
//
import UIComponents
import DataProvider

final class ArtistAlbumRouter {
    
    static func create(artist: ArtistCellProtocol) -> ArtistAlbumViewController {
        let service = Service()
        let viewModel = ArtistAlbumViewModel(artist:artist, service: service)
        let viewController = ArtistAlbumViewController(viewModel: viewModel)
        return viewController
    }
}
