//
//  Artist.swift
//  DataProvider
//
//  Created by cihan on 14.06.23.
//

import Foundation
public struct Artist: Codable {
    
    public let id: Int?
    public let name: String?
    public let imageUrl: String?
    public let type: String?
 

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case imageUrl = "picture_xl"
        case type = "type"
    }
}
