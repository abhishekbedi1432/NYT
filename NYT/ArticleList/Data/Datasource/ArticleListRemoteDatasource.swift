//
//  ArticleListRemoteDatasource.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

protocol ArticleListRemoteDatasourceContractor {
    func fetchArticles(completion: @escaping (Result<ArticleListResponse, Error>) -> Void)
}

class ArticleListRemoteDatasource: ArticleListRemoteDatasourceContractor {
    
    var baseUrl: String
    var networkManager: NetworkContract
    
    init(baseUrl: String = Constants.host,
         networkManager: NetworkContract = NetworkManager()) {
        self.baseUrl = baseUrl
        self.networkManager = networkManager
    }
    
    func fetchArticles(completion: @escaping (Result<ArticleListResponse, Error>) -> Void) {
        let request = ArticleListRequest(baseUrl: baseUrl)
        networkManager.sendRequest(request: request, completion: completion)
    }
}
