//
//  CatalogViewModel.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import UIKit
import RxSwift

protocol CatalogViewModelProtocol {
    func fetchBanners()
    func fetchSections()
    var banners: PublishSubject<[Banner.BannerData]> { get }
}

class CatalogViewModel: CatalogViewModelProtocol {
    
    var useCase: CatalogUseCaseProtocol
    
    public init(useCase: CatalogUseCaseProtocol = CatalogUseCase()) {
        self.useCase = useCase
    }
    
    public let banners : PublishSubject<[Banner.BannerData]> = PublishSubject()
    
    
    func fetchBanners() {
        useCase.getBanners { [weak self] result in
            switch result {
            case .success(let value):
                self?.banners.onNext(value.result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchSections() {
        
    }
    
    
}
