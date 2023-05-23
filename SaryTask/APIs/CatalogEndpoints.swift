//
//  CatalogEndpoints.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

public enum CatalogEndpoints {
    case getBanners
    case getSections
}

 extension CatalogEndpoints: EndpointProtocol {
     public var url: String {
         switch self {
         case .getBanners:
             return "https://staging.sary.to/api/baskets/328594/banners/"
         case .getSections:
             return "https://staging.sary.to/api/baskets/328594/catalog/"
         }
     }
}
