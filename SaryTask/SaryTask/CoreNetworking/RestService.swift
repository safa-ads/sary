//
//  RestService.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 20/05/2023.
//

import Foundation

// MARK: - RestServiceProtocol

public protocol RestServiceProtocol {
    func request(endpoint: EndpointProtocol, deliverQueue: DispatchQueue, completion: @escaping (Result<Data, Error>) -> Void)
}

public class RestService: RestServiceProtocol {
    public init() { }
    public func request(endpoint: EndpointProtocol, deliverQueue: DispatchQueue = DispatchQueue.main, completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let urlRequest = endpoint.urlRequest else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data {
                completion(.success(data))
            }
            if let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

