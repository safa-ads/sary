//
//  CatalogItems.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import Foundation

public struct CatalogItems: Codable {
    public var result: [Items]
    
    public struct Items: Codable {
        public var showTitle: Bool
        public var title: String
        public var rowCount: Int
        public var uiType: UIType
        public var dataType: DataType
        public var data: [CatalogData]
    }
    
    public struct CatalogData: Codable {
        public var image: String
    }
    public enum UIType: String, Codable {
        case linear, grid
    }
    
    public enum DataType: String, Codable {
        case banner, unknown
    }
}

extension CatalogItems.DataType {
    public init(from decoder: Decoder) throws {
        self = try CatalogItems.DataType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}
