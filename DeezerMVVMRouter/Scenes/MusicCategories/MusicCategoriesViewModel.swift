//
//  MusicCategoriesViewModel.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 13.05.23.
//

import Foundation
import Utilities
import DataProvider
import UIComponents

protocol MusicCategoriesViewDataSource {
    var numberOfItems: Int { get }
    func cellForItemAt(indexPath: IndexPath) -> CategoriesCellProtocol
}

protocol MusicCategoriesViewEventSource {
    var reloadData: VoidClosure? { get set }
    var titleName: StringClosure? { get set }

}

protocol MusicCategoriesViewProtocol: MusicCategoriesViewDataSource, MusicCategoriesViewEventSource {
    
    func getAllCategories()
    func didSelectItem(indexPath: IndexPath)
 
}

protocol MusicCategoriesViewRouteDelegate {
    func showDetail(genre: CategoriesCellProtocol)
}

final class MusicCategoriesViewModel: BaseViewModel, MusicCategoriesViewProtocol {
    var routeDelegate: MusicCategoriesViewRouteDelegate?
    private var cellItems: [CategoriesCellProtocol] = []
     var reloadData: VoidClosure?
     var titleName: StringClosure?
    let service: ServiceProtocol
    init(service: ServiceProtocol) {
        self.service = service
        
    }
 
    func cellForItemAt(indexPath: IndexPath) -> CategoriesCellProtocol {
        return cellItems[indexPath.row]
    }
    var numberOfItems: Int {
       return cellItems.count
    }
    func viewDidLoad() {
        titleName?("Music Categories")
    }
    

}

extension MusicCategoriesViewModel {
    func getAllCategories() {
        service.getCategories() { [weak self] response in
            guard let self = self else { return }
            self.cellItems = response?.data.map { CategoriesCellModel(categories: $0) } ?? []
            self.reloadData?()
        
        } onError: { error in
            print(error?.localizedDescription)
        }
    }
}

extension MusicCategoriesViewModel {
    func didSelectItem(indexPath: IndexPath) {
        let item = cellItems[indexPath.row]
       // guard let artistId = item.categoriesId else { return }
      
        self.routeDelegate?.showDetail(genre: item)
    }
}
