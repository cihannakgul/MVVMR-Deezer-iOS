//
//  ArtistCellModel.swift
//  UIComponents
//
//  Created by cihan on 15.06.23.
//

import Foundation

public protocol ArtistCellDataSource: AnyObject {
    var artistImageView: String? { get set }
    var artistTitle: String? { get set }
    var artistId: Int? { get set }
}

public protocol ArtistCellEventSource: AnyObject {
    
}

public protocol ArtistCellProtocol: ArtistCellDataSource, ArtistCellEventSource {
    
}

public final class ArtistCellModel: ArtistCellProtocol {
    public var artistId: Int?
    public var artistTitle: String?
    public var artistImageView: String?


    
    public init(artistId: Int?, artistTitle: String?, artistImageView: String? ) {
        self.artistId = artistId
        self.artistTitle = artistTitle
        self.artistImageView = artistImageView

    }
}
