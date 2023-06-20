//
//  Album.swift
//  DataProvider
//
//  Created by cihan on 19.06.23.
//

import Foundation
public struct Album: Codable {
    
    public let id: Int?
    public let title: String?
    public let imageUrl: String?
    public let release_date: String?
    public let tracklist: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case imageUrl = "cover_big"
        case release_date = "release_date"
        case tracklist = "tracklist"
    }
}
