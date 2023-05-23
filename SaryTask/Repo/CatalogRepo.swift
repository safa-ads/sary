//
//  CatalogRepo.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import Foundation

public protocol CatalogRepoProtocol {
    func getBanners(completion: @escaping (Result<Banner, Error>) -> Void)
    func getSections(completion: @escaping (Result<CatalogItems, Error>) -> Void)
}

public class CatalogRepo: CatalogRepoProtocol {
    public var repo: BaseRepo
    public init(repo: BaseRepo = BaseRepo()) {
        self.repo = repo
    }
    
    public func getBanners(completion: @escaping (Result<Banner, Error>) -> Void) {
        let endpoint = CatalogEndpoints.getBanners
        repo.getData(endpoint: endpoint) { response in
            completion(response)
        }
    }
    
    public func getSections(completion: @escaping (Result<CatalogItems, Error>) -> Void) {
        let endpoint = CatalogEndpoints.getSections
        repo.getData(endpoint: endpoint) { response in
            completion(response)
        }
    }
}
