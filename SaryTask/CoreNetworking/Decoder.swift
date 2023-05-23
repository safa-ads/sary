//
//  Decoder.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 21/05/2023.
//

import Foundation

public class CustomDecoder {
    public static func decoder<T: Codable>(data: Data) throws -> T  {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let value =  try jsonDecoder.decode(T.self, from: data)
        return value
    }
}

