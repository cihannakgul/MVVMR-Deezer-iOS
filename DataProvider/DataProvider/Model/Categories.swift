//
//  Categories.swift
//  DataProvider
//
//  Created by cihan on 22.05.23.
//

import Foundation
public struct Categories: Codable {
    
    public let id: Int?
    public let name: String?
    public let imageUrl: String?
//    public let pic1: String?
//    public let pic2: String?
//    public let pic3: String?
//    public let pic4: String?
    public let type: String?
 

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
//        case pic1 = "picture"
//        case pic2 = "picture_small"
//        case pic3 = "picture_medium"
//        case pic4 = "picture_big"
        case imageUrl = "picture_xl"
        case type = "type"
    }
}
