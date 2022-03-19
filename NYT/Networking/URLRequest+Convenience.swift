//
//  URLRequest+Convenience.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

extension URLRequest {
    
    init?(baseURL: URL, path: String?, parameters: [String: AnyObject]?) {
        
        var url: URL = baseURL
        if let path = path, !path.isEmpty {
            url = baseURL.appendingPathComponent(path)
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        components?.queryItems = parameters?.map { key, value -> URLQueryItem in
            URLQueryItem(name: String(key), value: String(describing: value))
        }
        
        guard let componentsURL = components?.url else {
            return nil
        }
        self.init(url: componentsURL)
    }
}
