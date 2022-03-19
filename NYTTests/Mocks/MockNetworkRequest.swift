//
//  MockNetworkRequest.swift
//  NYTTests
//
//  Created by kbedi on 19/03/2022.
//

import Foundation
@testable import NYT

class MockNetworkRequest: NetworkRequest {
    
    var urlRequest: URLRequest? {
        
        guard let url = URL(string: baseURL) else {
            return nil
        }

        return URLRequest(url: url)
    }
    
    var requestPath: String {
        "garsdfs xcn lkxj x c  n lbage"
    }
    
}
