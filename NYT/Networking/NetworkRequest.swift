//
//  NetworkRequest.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

protocol NetworkRequest {
    var baseURL: String { get }
    var apiKey: String { get }
    var requestPath: String { get }
    var headerParams: [String: AnyObject] { get }
    var urlRequest: URLRequest? { get }
}

extension NetworkRequest {
    var baseURL: String {
        return NetworkConstants.baseUrl
    }
    
    var apiKey: String {
        return NetworkConstants.apiKey
    }
    
    var headerParams: [String: AnyObject] {
        var params:[String: AnyObject] = [:]
        params["api-key"] = apiKey as AnyObject
        return params
    }
    
    var urlRequest: URLRequest? {
        
        let urlString  = baseURL +  "/" + requestPath
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        components?.queryItems = headerParams.map { key, value -> URLQueryItem in
            URLQueryItem(name: String(key), value: String(describing: value))
        }
        guard let componentsURL = components?.url else {
            return nil
        }
        return URLRequest(url: componentsURL)
    }
}
