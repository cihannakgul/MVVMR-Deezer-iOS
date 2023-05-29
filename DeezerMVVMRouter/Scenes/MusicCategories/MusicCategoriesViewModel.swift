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
 
}

protocol MusicCategoriesViewRouteDelegate: AnyObject {
    func showDetail()
}

final class MusicCategoriesViewModel: BaseViewModel, MusicCategoriesViewProtocol {
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
    
    weak var routeDelegate: MusicCategoriesViewRouteDelegate?

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


