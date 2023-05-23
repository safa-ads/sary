//
//  Catalog+Stubs.swift
//  SaryTaskTests
//
//  Created by Safa Mohamed Abdo El-Sayed on 23/05/2023.
//

@testable import SaryTask

extension Banner {
    static func stub() -> Self {
        .init(result: [.init(photo: "https://photo.png")])
    }
}

extension CatalogItems {
    static func stub() -> Self {
        .init(result: [.init(showTitle: false,
                             title: "title",
                             rowCount: 1,
                             uiType: .grid,
                             dataType: .banner,
                             data: [.init(image: "https://photo.png")])])
    }
}
