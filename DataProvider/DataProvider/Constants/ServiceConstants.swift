//
//  ServiceConstants.swift
//  DataProvider
//
//  Created by cihan on 25.05.23.
//

import Foundation


import Foundation

public final class Constant {
    // https://api.deezer.com/artist/8354140/albums
    public enum ServiceEndPoint: String {
        
        case baseUrl = "https://api.deezer.com/"
        
       public static func getGenreUrl() -> String {
            "\(baseUrl.rawValue)\("genre")"
        }
        
        public static func getArtistUrl(genreId: Int) -> String {
             "\(baseUrl.rawValue)\("genre/")\(genreId)\("/artists")"
         }
    
        public static func getAlbumOfArtistUrl(artistId: Int) -> String {
             "\(baseUrl.rawValue)\("artist/")\(artistId)\("/albums")"
         }
    }
}
