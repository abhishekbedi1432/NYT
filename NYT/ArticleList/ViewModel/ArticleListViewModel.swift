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
    func fetchArticles(withRange: Int ) 

}

class ArticleListViewModel: ArticleListContract {
    
    // State
    @Published var articles: [Article] = []
    
    private let networkManager: NetworkContract

    init(networkManager: NetworkContract = URLSession.shared) {
        self.networkManager = networkManager
    }

    func fetchArticles() {}

    func fetchArticles(withRange: Int = 1) {
        let request = ArticleListRequest(baseUrl: NetworkConstants.host)
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
