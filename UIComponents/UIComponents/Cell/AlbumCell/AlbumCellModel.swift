//
//  AlbumCellModel.swift
//  UIComponents
//
//  Created by cihan on 19.06.23.
//

import Foundation

public protocol AlbumCellDataSource: AnyObject {
    var albumImageView: String? { get set }
    var albumTitle: String? { get set }
    var albumId: Int? { get set }
    var albumDate: String? { get set }
    var albumTrackList: String? { get set }
}

public protocol AlbumCellEventSource: AnyObject {
    
}

public protocol AlbumCellProtocol: AlbumCellDataSource, AlbumCellEventSource {
    
}

public final class AlbumCellModel: AlbumCellProtocol {
    public var albumId: Int?
    public var albumTitle: String?
    public var albumImageView: String?
    public var albumDate: String?
    public var albumTrackList: String?


    
    public init(albumId: Int?, albumTitle: String?, albumImageView: String?,albumDate:String?, albumTrackList: String? ) {
        self.albumId = albumId
        self.albumTitle = albumTitle
        self.albumImageView = albumImageView
        self.albumDate = albumDate
        self.albumTrackList = albumTrackList

    }
}
