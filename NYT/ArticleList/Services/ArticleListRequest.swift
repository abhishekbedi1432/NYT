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

    init(baseUrl: String, timePeriod: Int) {
        self.baseUrl = baseUrl
        self.timePeriod = timePeriod
    }
    
    var urlRequest: URLRequest {
        
        var params:[String: AnyObject] = [:]
        params["api-key"] = NetworkConstants.apiKey as AnyObject
        return URLRequest(baseURL: URL(string: baseUrl)!,
                          path: "v2/mostviewed/all-sections/\(timePeriod).json",
                          parameters: params)!
    }
}

// // https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=7AP916lfRg6y1NCiz6kqyqH1v9CIB3ah

