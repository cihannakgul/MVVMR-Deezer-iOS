//
//  ServiceConstants.swift
//  DataProvider
//
//  Created by cihan on 25.05.23.
//

import Foundation


import Foundation

public final class Constant {
    
    public enum ServiceEndPoint: String {
        
        case baseUrl = "https://api.deezer.com/"
        
       public static func getGenreUrl() -> String {
            "\(baseUrl.rawValue)\("genre")"
        }
    
    }
}
