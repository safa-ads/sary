//
//  CatalogViewModelUnitTests.swift
//  SaryTaskTests
//
//  Created by Safa Mohamed Abdo El-Sayed on 23/05/2023.
//

import XCTest
@testable import SaryTask
import RxSwift

final class CatalogViewModelUnitTests: XCTestCase {
    private var catalogUseCase: CatalogUseCaseMock!
    private var sut: CatalogViewModel!
    private let disposeBag = DisposeBag()
    
    
    //MARK: - Life Sycle
    override func setUp() {
        super.setUp()
        catalogUseCase = CatalogUseCaseMock()
        sut = CatalogViewModel(useCase: catalogUseCase)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        catalogUseCase = nil
    }
    
    func testGetBanners() {
        //Given
        let mockedResponse = Banner.stub()
        var banner: [Banner.BannerData]?
        sut.banners.subscribe { items in
            banner = items.element
        }.disposed(by: disposeBag)
        
        //When
        sut.fetchBanners()
        
        //Then
        XCTAssertEqual(banner?.first?.photo, mockedResponse.result.first?.photo)
    }
    
    func testGetSections() {
        //Given
        let mockedResponse = CatalogItems.stub()
        var items: [CatalogItems.Items]?
        sut.sections.subscribe { value in
            items = value.element
        }.disposed(by: disposeBag)
        
        //When
        sut.fetchSections()
        
        //Then
        XCTAssertEqual(items?.first?.rowCount, mockedResponse.result.first?.rowCount)
        XCTAssertEqual(items?.first?.showTitle, mockedResponse.result.first?.showTitle)
        XCTAssertEqual(items?.first?.data.first?.image, mockedResponse.result.first?.data.first?.image)
    }
}

class CatalogUseCaseMock: CatalogUseCaseProtocol {
    func getBanners(completion: @escaping (Result<Banner, Error>) -> Void) {
        completion(.success(Banner.stub()))
    }
    
    func getSections(completion: @escaping (Result<CatalogItems, Error>) -> Void) {
        completion(.success(CatalogItems.stub()))
    }
}
