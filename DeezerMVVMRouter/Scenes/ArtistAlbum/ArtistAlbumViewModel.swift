//
//  ArtistAlbumViewModel.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 19.06.23.
//

import Foundation
import Utilities
import DataProvider
import UIComponents

protocol ArtistAlbumViewDataSource {}

protocol ArtistAlbumViewEventSource {
    var titleName: StringClosure? { get set }
    var artistImage: String? { get set }

}

protocol ArtistAlbumViewProtocol: ArtistAlbumViewDataSource, ArtistAlbumViewEventSource {}

final class ArtistAlbumViewModel: BaseViewModel, ArtistAlbumViewProtocol {
    var titleName: StringClosure?
    var artistImage: String?
    private var service: ServiceProtocol
    private var artist: ArtistCellProtocol
    private var cellItems: [AlbumCellProtocol] = []
    var reloadData: VoidClosure?

    
    init(artist: ArtistCellProtocol, service: ServiceProtocol) {
        self.artist = artist
        self.service = service
    }
    func cellForItemAt(indexPath: IndexPath) -> AlbumCellProtocol {
        return cellItems[indexPath.row]
    }
    var numberOfItems: Int {
       return cellItems.count
    }
    func loadTitle() {
        guard let title = artist.artistTitle else { return }
        titleName?(title)
    }
    
    func loadArtistImage() {
        guard let imageUrl = artist.artistImageView else { return }
        artistImage = imageUrl
    }
}
extension ArtistAlbumViewModel {
    func getAllAlbums() {
        print("againdebug \(artist.artistId)")
        service.getAlbumOfArtist(artistId:artist.artistId ?? 0) { [weak self] response in
            guard let self = self else { return }
            self.cellItems = response?.data.map { AlbumCellModel(album: $0) } ?? []
            print("againdebug \(self.cellItems[0].albumTitle)")

            self.reloadData?()
        
        } onError: { error in
            print(error?.localizedDescription)
        }
    }
}
