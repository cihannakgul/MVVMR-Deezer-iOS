//
//  ServiceRequests.swift
//  DataProvider
//
//  Created by cihan on 25.05.23.
//

import Alamofire

public protocol ServiceProtocol {
     func getCategories(onSuccess: @escaping (GenreResponse?) -> (), onError: @escaping(AFError?) -> ())
    
    func getArtist(genreId: Int, onSuccess: @escaping (ArtistResponse?) -> (), onError: @escaping(AFError?) -> ())
    
    func getAlbumOfArtist(artistId: Int, onSuccess: @escaping (AlbumResponse?) -> (), onError: @escaping(AFError?) -> ()) // JOB TO DO 
}

public final class Service: ServiceProtocol {
    public init() { }
    
    public func getCategories(onSuccess: @escaping (GenreResponse?) -> (), onError: @escaping (Alamofire.AFError?) -> ()) {
        ServiceManager.shared.fetch(path: Constant.ServiceEndPoint.getGenreUrl(), onSuccess: { response in
            onSuccess(response)
        }, onError: { error in
            onError(error)
        })
    }
    
    public func getArtist(genreId:Int, onSuccess: @escaping (ArtistResponse?) -> (), onError: @escaping (Alamofire.AFError?) -> ()) {
        
        ServiceManager.shared.fetch(path: Constant.ServiceEndPoint.getArtistUrl(genreId: genreId), onSuccess: { response in
            onSuccess(response)
        }, onError: { error in
            onError(error)
        })
    }
    
    
    public func getAlbumOfArtist(artistId:Int, onSuccess: @escaping (AlbumResponse?) -> (), onError: @escaping (Alamofire.AFError?) -> ()) {
        
        ServiceManager.shared.fetch(path: Constant.ServiceEndPoint.getAlbumOfArtistUrl(artistId: artistId), onSuccess: { response in
            onSuccess(response)
        }, onError: { error in
            onError(error)
        })
    }
}

