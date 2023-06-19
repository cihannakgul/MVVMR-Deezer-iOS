//
//  CategoriesCellModel.swift
//  UIComponents
//
//  Created by cihan on 17.05.23.
//
import Foundation

public protocol CategoriesCellDataSource: AnyObject {
    var categoriesImageView: String? { get set }
    var categoriesTitle: String? { get set }
    var categoriesId: Int? { get set }
}

public protocol CategoriesCellEventSource: AnyObject {
    
}

public protocol CategoriesCellProtocol: CategoriesCellDataSource, CategoriesCellEventSource {
    
}


public final class CategoriesCellModel: CategoriesCellProtocol {
    public var categoriesId: Int?
    public var categoriesTitle: String?
    public var categoriesImageView: String?


    
    public init(categoriesId: Int?, categoriesTitle: String?, categoriesImageView: String? ) {
        self.categoriesId = categoriesId
        self.categoriesTitle = categoriesTitle
        self.categoriesImageView = categoriesImageView

    }
}
