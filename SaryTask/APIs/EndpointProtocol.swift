//
//  EndpointProtocol.swift
//  SaryTask
//
//  Created by Safa Mohamed Abdo El-Sayed on 20/05/2023.
//

import Foundation

public protocol EndpointProtocol {
    var url: String { get }
    var method: HttpMethod { get }
    var headers: [String: String] { get }
}

public extension EndpointProtocol {
    var method: HttpMethod { .get }
    var headers: [String: String] {
        ["App-Version" : "7.7.0.0.0",
         "Accept-Language": "ar",
         "Device-Type": "ios",
         "Authorization": "token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDQyOTIsInVzZXJfcGhvbmUiOiIyMDEwNjQ5ODkyNTAifQ.zNhafprWylIawDsPfGjnkxh3icOV-XN-HgMD3uiXaG0"]
    }
    
    
    var urlRequest: URLRequest? {
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}

public enum HttpMethod: String {
    case get
    case post
    case put
    case delete

}
