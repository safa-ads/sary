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
                self?.banners.onNext([.init(photo: "https://storcpdkenticomedia.blob.core.windows.net/media/recipemanagementsystem/media/recipe-media-files/recipes/retail/x17/2020_belgian-style-waffles_16700_760x580.jpg?ext=.jpg"),
                                      .init(photo: "https://media.istockphoto.com/id/185266029/photo/waffles-with-fruit-and-maple-syrup-on-a-marble-counter.jpg?s=612x612&w=0&k=20&c=YkBBzuSLisdHiECgS_NHN6gOyOMN6exADFk-RIlfKtI=")])
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

