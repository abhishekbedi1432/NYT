//
//  ArticleListRemoteDatasource.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

protocol ArticleListRemoteDatasourceContract {
    func fetchArticles(completion: @escaping (Result<ArticleListResponse, Error>) -> Void)
}

class ArticleListRemoteDatasource: ArticleListRemoteDatasourceContract {
    
    var baseUrl: String
    var networkManager: NetworkContract
    
    init(baseUrl: String = NetworkConstants.host,
         networkManager: NetworkContract = URLSession.shared) {
        self.baseUrl = baseUrl
        self.networkManager = networkManager
    }
    
    func fetchArticles(completion: @escaping (Result<ArticleListResponse, Error>) -> Void) {
        let request = ArticleListRequest(baseUrl: baseUrl)
        networkManager.sendRequest(request: request, completion: completion)
    }
}
