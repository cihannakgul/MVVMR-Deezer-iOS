//
//  ServiceRequests.swift
//  DataProvider
//
//  Created by cihan on 25.05.23.
//

import Alamofire

public protocol ServiceProtocol {
     func getCategories(onSuccess: @escaping (GenreResponse?) -> (), onError: @escaping(AFError?) -> ())
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
    
    
 
}

