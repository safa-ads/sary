//
//  DataSourceProtocol.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 20/05/2023.
//

import Foundation

public protocol DataSourceProtocol {
    func getData<T: Codable>(endpoint: EndpointProtocol, completion:  @escaping (Result<T, Error>) -> Void)
}
