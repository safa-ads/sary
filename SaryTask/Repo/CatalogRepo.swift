//
//  CatalogRepo.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import Foundation

public protocol CatalogRepoProtocol {
    func getBanners(completion: @escaping (Result<Banner, Error>) -> Void)
    func getSections()
}

public class CatalogRepo: CatalogRepoProtocol {
    public var repo: BaseRepo
    public init(repo: BaseRepo = BaseRepo()) {
        self.repo = repo
    }
    
    public func getBanners(completion: @escaping (Result<Banner, Error>) -> Void) {
        let endpoint = CatalogEndpoints.getBanners
        repo.getData(endpoint: endpoint) { result in
            switch result {
            case .success(let data):
                do {
                    let banners = try Decoder.decoder(data: data) as Banner
                    completion(.success(banners))
                } catch(let error) {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getSections() {
        let endpoint = CatalogEndpoints.getSections
        repo.getData(endpoint: endpoint) { result in
            
        }
    }
    
    
}
