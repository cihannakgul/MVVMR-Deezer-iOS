//
//  DataProviderTesting.swift
//  DataProvider
//
//  Created by cihan on 13.05.23.
//

import Foundation

     
    public func test() {
        let artistUrl = Constant.ServiceEndPoint.getAlbumOfArtistUrl(artistId: 8354140)
        print(artistUrl)
        var service: ServiceProtocol = Service()
        service.getAlbumOfArtist(artistId: 8354140) { response in
            print(response)
        } onError: { error in
            print(error?.localizedDescription)
        }

        
    }

