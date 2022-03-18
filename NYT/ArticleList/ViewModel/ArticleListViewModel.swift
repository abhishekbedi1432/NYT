//
//  ArticleListViewModel.swift
//  NYT
//
//  Created by kbedi on 17/03/2022.
//

import Foundation

protocol ArticleListContract: ObservableObject {
    var articles: [Article] { get set }
    func fetchArticles()
}

class ArticleListViewModel: ArticleListContract {
    
    // State
    @Published var articles: [Article] = []
    
    // Dependencies
    private var articlesRepository: ArticleListRepositoryContract?

    private let networkManager: NetworkContract

    init(articlesRepository: ArticleListRepositoryContract = ArticleListRepository(),
         networkManager: NetworkContract = URLSession.shared) {
        
        self.articlesRepository = articlesRepository
        self.networkManager = networkManager
    }
    
    init(networkManager: NetworkContract = URLSession.shared) {
        
//        self.articlesRepository = articlesRepository
        self.networkManager = networkManager
    }

    func fetchArticles() {
        let request = ArticleListRequest(baseUrl: Constants.host)
        networkManager.sendRequest(request: request, completion: onCompletion)
        
        
//        networkManager.sendRequest(request: request) { [weak self] result in
//            switch result {
//                case .success(let articles):
//                    DispatchQueue.main.async { [weak self] in
//                        self?.articles = articles
//                    }
//                case .failure(let error):
//                    print(error)
//            }
//
//        }
        
//        articlesRepository?.fetchArticles { [weak self] result in
//            switch result {
//                case .success(let articles):
//                    DispatchQueue.main.async { [weak self] in
//                        self?.articles = articles
//                    }
//                case .failure(let error):
//                    print(error)
//            }
//        }
    }
    
    
    private func onCompletion(result: Result<ArticleListResponse, Error>) {
        
        switch result {
            case .success(let articles):
                self.articles = articles.articles ?? []
//                DispatchQueue.main.async { [weak self] in
//                    self?.articles = articles.articles ?? []
//                }
            case .failure(let error):
                print(error)
        }
    }
}
