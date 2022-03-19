//
//  ArticleListRequest.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

class ArticleListRequest: NetworkRequest {
    
    private var timePeriod: Int
    
    init(timePeriod: Int) {
        self.timePeriod = timePeriod
    }
    
    var requestPath: String {
        "v2/mostviewed/all-sections/\(timePeriod).json"
    }
}
