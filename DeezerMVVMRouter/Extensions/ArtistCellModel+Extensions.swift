//
//  ArtistCellModel+Extensions.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 15.06.23.
//

import Foundation
import UIComponents
import DataProvider

extension ArtistCellModel {
    convenience init(artists: Artist) {
        self.init(artistId: artists.id, artistTitle: artists.name, artistImageView: artists.imageUrl)
    }
}
