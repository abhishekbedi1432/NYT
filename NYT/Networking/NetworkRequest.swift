//
//  NetworkRequest.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

typealias Dictionary = [String: String]

protocol NetworkRequest {
    var baseURL: String { get }
    var apiKey: String { get }
    var requestPath: String { get }
    var headerParams: Dictionary { get }
    var params: [String: Any] { get }
    var urlRequest: URLRequest? { get }
}

extension NetworkRequest {
    
    var baseURL: String {
        return NetworkConstants.baseUrl
    }
    
    var apiKey: String {
        return NetworkConstants.apiKey
    }
    
    var headerParams: Dictionary {
        [:]
    }
    
    var params: [String: Any] {
        [:]
    }
    
    var urlRequest: URLRequest? {
        
        let urlString  = baseURL +  "/" + requestPath
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        components?.queryItems = params.map { key, value -> URLQueryItem in
            URLQueryItem(name: String(key), value: String(describing: value))
        }
        guard let componentsURL = components?.url else {
            return nil
        }
        
        var request = URLRequest(url: componentsURL)
        request.allHTTPHeaderFields = headerParams
        
        return request
    }
}
