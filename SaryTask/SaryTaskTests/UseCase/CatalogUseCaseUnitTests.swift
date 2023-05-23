//
//  CatalogUseCaseUnitTests.swift
//  SaryTaskTests
//
//  Created by Safa Mohamed Abdo El-Sayed on 23/05/2023.
//

import XCTest
@testable import SaryTask

final class CatalogUseCaseUnitTests: XCTestCase {
    private var catalogRepo: CatalogRepoMock!
    private var sut: CatalogUseCase!

    
    //MARK: - Life Sycle
    override func setUp() {
        super.setUp()
        catalogRepo = CatalogRepoMock()
        sut = CatalogUseCase(repo: catalogRepo)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        catalogRepo = nil
    }

    func testCatalogUseCase_Banner_OnSuccess() {
        //Given
        let response = Banner.stub()
        
        //WHEN
        var tempResponse: Banner?
        sut.getBanners { response in
            switch response {
            case let .success(data):
                tempResponse = data
            case .failure:
                break
            }
        }
        
        //Then
        XCTAssertEqual(tempResponse?.result.first?.photo, response.result.first?.photo)
    }
    
    func testCatalogUseCase_Sections_OnSuccess() {
        //Given
        let response = CatalogItems.stub()
        
        //WHEN
        var tempResponse: CatalogItems?
        sut.getSections { response in
            switch response {
            case let .success(data):
                tempResponse = data
            case .failure:
                break
            }
        }
        
        //Then
        XCTAssertEqual(tempResponse?.result.first?.rowCount, response.result.first?.rowCount)
        XCTAssertEqual(tempResponse?.result.first?.showTitle, response.result.first?.showTitle)
        XCTAssertEqual(tempResponse?.result.first?.title, response.result.first?.title)
    }
}

class CatalogRepoMock: CatalogRepoProtocol {
    func getBanners(completion: @escaping (Result<Banner, Error>) -> Void) {
        completion(.success(Banner.stub()))
    }
    
    func getSections(completion: @escaping (Result<CatalogItems, Error>) -> Void) {
        completion(.success(CatalogItems.stub()))
    }
}
