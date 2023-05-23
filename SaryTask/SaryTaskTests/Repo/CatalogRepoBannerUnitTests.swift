//
//  CatalogRepoUnitTests.swift
//  SaryTaskTests
//
//  Created by Safa Mohamed Abdo El-Sayed on 23/05/2023.
//

import XCTest
@testable import SaryTask

final class CatalogRepoUnitTests: XCTestCase {
    private var sut: CatalogRepo!

    //MARK: - Life Cycle
    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testCatalogRepo_GetBanners_OnSuccess() {
        // Given
        let mockedResponse = Banner.stub()
        let remoteDataSource =  RemoteDataSourceMock<Banner>()
        sut = CatalogRepo(repo: .init(remote: remoteDataSource))
        remoteDataSource.response = .success(mockedResponse)

        // When
        var tempResponse: Banner?
        
        sut.getBanners { response in
            let value = try? response.get()
            tempResponse = value
        }

        // Then
        XCTAssertEqual(tempResponse?.result.first?.photo, mockedResponse.result.first?.photo)
    }


    func testCatalogRepo_GetSections_OnSuccess() {
        // Given
        let mockedResponse = CatalogItems.stub()
        let remoteDataSource = RemoteDataSourceMock<CatalogItems>()
        sut = CatalogRepo(repo: .init(remote: remoteDataSource))
        remoteDataSource.response = .success(mockedResponse)

        // When
        var tempResponse: CatalogItems?
        
        sut.getSections{ response in
            let value = try? response.get()
            tempResponse = value
        }

        // Then
        XCTAssertEqual(tempResponse?.result.first?.rowCount, mockedResponse.result.first?.rowCount)
        XCTAssertEqual(tempResponse?.result.first?.showTitle, mockedResponse.result.first?.showTitle)
        XCTAssertEqual(tempResponse?.result.first?.title, mockedResponse.result.first?.title)
        XCTAssertEqual(remoteDataSource.counter, 1)
    }
}
