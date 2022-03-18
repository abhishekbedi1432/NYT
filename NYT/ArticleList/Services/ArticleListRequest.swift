//
//  ArticleListRequest.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

class ArticleListRequest: NetworkRequest {
    
    var baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    //TODO: - Fix this anmyobject issue
    var urlRequest: URLRequest {
        
        var params:[String: AnyObject] = [:]
        params["api-key"] = NetworkConstants.apiKey as AnyObject
        
        return URLRequest(baseURL: URL(string: baseUrl)!,
                          path: "v2/mostviewed/all-sections/1.json",
                          parameters: params)!
    }
}

// // https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=7AP916lfRg6y1NCiz6kqyqH1v9CIB3ah

