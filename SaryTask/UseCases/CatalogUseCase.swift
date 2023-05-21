//
//  CatalogUseCase.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

protocol CatalogUseCaseProtocol {
    func getBanners(completion: @escaping (Result<Banner, Error>) -> Void)
    func getSections(completion: @escaping (Result<CatalogItems, Error>) -> Void)
}
public class CatalogUseCase: CatalogUseCaseProtocol {
    
    public let repo: CatalogRepoProtocol
    
    public init(repo: CatalogRepoProtocol = CatalogRepo()) {
        self.repo = repo
    }
    
    func getBanners(completion: @escaping (Result<Banner, Error>) -> Void) {
        repo.getBanners { response in
            completion(response)
        }
    }
    
    func getSections(completion: @escaping (Result<CatalogItems, Error>) -> Void) {
        repo.getSections { response in
            completion(response)
        }
    }
}
