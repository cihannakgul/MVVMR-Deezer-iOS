//
//  CategoriesCellModel+Extensions.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 25.05.23.
//

import Foundation
import UIComponents
import DataProvider

extension CategoriesCellModel {
    convenience init(categories: Categories) {
        self.init(categoriesId: categories.id, categoriesTitle: categories.name, categoriesImageView: categories.imageUrl)
    }
}
