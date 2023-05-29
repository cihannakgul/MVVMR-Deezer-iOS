//
//  ServiceManager.swift
//  DataProvider
//
//  Created by cihan on 25.05.23.
//

import Alamofire

public final class ServiceManager {
    public static let shared: ServiceManager = ServiceManager()
}


extension ServiceManager {
    public func fetch<T>(path: String, onSuccess: @escaping (T) -> (), onError: @escaping (AFError?) ->()) where T: Codable {
        AF.request(path, encoding: JSONEncoding.default).validate().responseDecodable(of: T.self) { response in
            guard let model = response.value else { onError(response.error); return }
            onSuccess(model)
        }
    }
}

