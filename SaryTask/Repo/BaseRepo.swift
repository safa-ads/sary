//
//  BaseRepo.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import Foundation

public protocol BaseRepoProtocol {
    func getData(endpoint: EndpointProtocol, completion:  @escaping (Result<Data, Error>) -> Void)
}

public class BaseRepo: BaseRepoProtocol {
    private let remote: RemoteDataSourceProtocol
    public init( remote: RemoteDataSourceProtocol = RemoteDataSource()) {
        self.remote = remote
    }
        
    public func getData(endpoint: EndpointProtocol, completion:  @escaping (Result<Data, Error>) -> Void) {
            remote.getData(endpoint: endpoint, completion: completion)
        }
}

