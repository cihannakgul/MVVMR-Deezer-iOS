//
//  ArtistViewModel.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 14.06.23.
//

import Foundation
import DataProvider
import Utilities
import UIComponents

protocol ArtistViewDataSource {
    var numberOfItems: Int { get }
    func cellForItemAt(indexPath: IndexPath) -> ArtistCellProtocol
}

protocol ArtistViewEventSource {
    var reloadData: VoidClosure? { get set }
    var titleName: StringClosure? { get set }
}

protocol ArtistViewProtocol: ArtistViewDataSource, ArtistViewEventSource {
    func getAllArtist()
    func didSelectItem(indexPath: IndexPath)
}
protocol ArtistViewDelegate {
    func showDetail(artist: ArtistCellProtocol)
}

final class ArtistViewModel:BaseViewModel, ArtistViewProtocol {
    
    var titleName: StringClosure?
    
    private var service: ServiceProtocol
    private var genre: CategoriesCellProtocol
    var routeDelegate: ArtistViewDelegate?
    private var cellItems: [ArtistCellProtocol] = []
    var reloadData: VoidClosure?
    init(genre: CategoriesCellProtocol, service: ServiceProtocol) {
        self.genre = genre
        self.service = service
        //self.movieImage = movie.poster?.convertUrl
    }
    func viewDidLoad() {
        guard let title = genre.categoriesTitle else { return }
        titleName?(title)
    }
    func cellForItemAt(indexPath: IndexPath) -> ArtistCellProtocol {
        return cellItems[indexPath.row]
    }
    var numberOfItems: Int {
       return cellItems.count
    }
    
}

extension ArtistViewModel {
    func getAllArtist() {
        print("testdata1 \(genre.categoriesId)")
        service.getArtist(genreId:genre.categoriesId ?? 0) { [weak self] response in
            guard let self = self else { return }
            self.cellItems = response?.data.map { ArtistCellModel(artists: $0) } ?? []
            self.reloadData?()
        
        } onError: { error in
            print(error?.localizedDescription)
        }
    }
}


extension ArtistViewModel {
    func didSelectItem(indexPath: IndexPath) {
        let item = cellItems[indexPath.row]
        routeDelegate?.showDetail(artist: item)
    }
}

