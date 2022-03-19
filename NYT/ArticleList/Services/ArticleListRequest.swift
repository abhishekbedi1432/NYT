//
//  ArticleListRequest.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

class ArticleListRequest: NetworkRequest {
    
    private var baseUrl: String
    private var timePeriod: Int
    private var apiKey: String

    init(baseUrl: String, timePeriod: Int, apiKey: String) {
        self.baseUrl = baseUrl
        self.timePeriod = timePeriod
        self.apiKey = apiKey
    }
    
    var urlRequest: URLRequest? {
        
        guard let url = URL(string: baseUrl) else {
            return nil
        }
        
        var params:[String: AnyObject] = [:]
        params["api-key"] = apiKey as AnyObject
        
        return URLRequest(baseURL: url,
                          path: "v2/mostviewed/all-sections/\(timePeriod).json",
                          parameters: params)!
    }
}

// // https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=7AP916lfRg6y1NCiz6kqyqH1v9CIB3ah

