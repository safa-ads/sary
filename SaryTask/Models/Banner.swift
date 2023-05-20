//
//  Banner.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import Foundation

public struct Banner: Codable {
    public let result: [BannerData]
    
    public struct BannerData:Codable {
        public let image: String
    }
}
