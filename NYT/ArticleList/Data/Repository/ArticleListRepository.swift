//
//  ArticleListRepository.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

//protocol ArticleListRepositoryContract {
//    func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void)
//}
//
//class ArticleListRepository: ArticleListRepositoryContract {
//    
//    private var remoteDatasource: ArticleListRemoteDatasourceContract
//    private var localDatasource: ArticleListLocalDatasourceContractor
//    
//    init(remoteDatasource: ArticleListRemoteDatasourceContract = ArticleListRemoteDatasource(),
//         localDatasource: ArticleListLocalDatasourceContractor = ArticleListLocalDatasource()) {
//        self.remoteDatasource = remoteDatasource
//        self.localDatasource = localDatasource
//    }
//    
//    func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
//        
//        if let cached = localDatasource.getArticles(), !cached.isEmpty {
//            completion(Result.success(cached))
//            return
//        }
//        
//        remoteDatasource.fetchArticles() { [weak self] (result) in
//            switch result {
//                case .success(let response):
//                    let articles = response.articles ?? []
//                    self?.localDatasource.setArticles(articles: articles)
//                    completion(Result.success(articles))
//                case .failure(let error):
//                    completion(Result.failure(error))
//            }
//        }
//    }
//}
