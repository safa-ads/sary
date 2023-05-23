//
//  CatalogViewModel.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import UIKit
import RxSwift
import RxCocoa

protocol CatalogViewModelProtocol {
    func fetchBanners()
    func fetchSections()
    var banners: PublishSubject<[Banner.BannerData]> { get }
    var sections: PublishSubject<[CatalogItems.Items]> { get }
}

class CatalogViewModel: CatalogViewModelProtocol {
    
    
    public let banners: PublishSubject<[Banner.BannerData]> = PublishSubject()
    public let sections: PublishSubject<[CatalogItems.Items]> = PublishSubject()
    var useCase: CatalogUseCaseProtocol
    
    public init(useCase: CatalogUseCaseProtocol = CatalogUseCase()) {
        self.useCase = useCase
    }
    
    
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
        useCase.getSections { [weak self] result in
            switch result {
            case .success(let value):
                let items = value.result.filter { $0.dataType == .banner }
                self?.sections.onNext(items)
            case .failure(let error):
                print(error)
            }
        }
    }
}

