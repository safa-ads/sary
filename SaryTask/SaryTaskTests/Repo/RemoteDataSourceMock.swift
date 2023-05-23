//
//  RemoteDataSourceMock.swift
//  SaryTaskTests
//
//  Created by Safa Mohamed Abdo El-Sayed on 23/05/2023.
//

import Foundation
import SaryTask

final class RemoteDataSourceMock<T: Codable>: RemoteDataSourceProtocol {
    public var response: Result<T, Error>?
    public var counter: Int = 0
    public var endpoint: EndpointProtocol?

    func getData<T: Codable>(endpoint: EndpointProtocol, completion: @escaping (Result<T, Error>) -> Void) {
        self.counter += 1
        self.endpoint = endpoint
        if let response  {
            switch response {
            case .success(let value):
                completion(.success(value as! T))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
