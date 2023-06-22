//
//  AlbumCellModel+Extensions.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 19.06.23.
//
import Foundation
import UIComponents
import DataProvider

extension AlbumCellModel {
    convenience init(album: Album) {
      
        self.init(albumId: album.id, albumTitle: album.title, albumImageView: album.imageUrl, albumDate: album.release_date, albumTrackList: album.tracklist)
    }
}
