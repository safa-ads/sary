//
//  RemoteDataSource.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 20/05/2023.
//


import Foundation

public typealias RemoteDataSourceProtocol = DataSourceProtocol

public class RemoteDataSource: RemoteDataSourceProtocol {
    private let remoteService: RestServiceProtocol
    
    public init(remoteService: RestServiceProtocol = RestService()) {
        self.remoteService = remoteService
    }
    
    public func getData(endpoint: EndpointProtocol, completion: @escaping (Result<Data, Error>) -> Void)  {
        remoteService.request(endpoint: endpoint, deliverQueue: .main, completion: completion)
    }
}
