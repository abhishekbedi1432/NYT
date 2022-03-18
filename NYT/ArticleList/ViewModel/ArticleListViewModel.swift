//
//  ArticleListViewModel.swift
//  NYT
//
//  Created by kbedi on 17/03/2022.
//

import Foundation

protocol ArticleListContract: ObservableObject {
    var articles: [Article] { get set }
    func fetchArticles(withRange: Int)
}

class ArticleListViewModel: ArticleListContract {
    
    // State
    @Published var articles: [Article] = []
    
    private let networkManager: NetworkContract

    init(networkManager: NetworkContract = URLSession.shared) {
        self.networkManager = networkManager
    }

    func fetchArticles(withRange timePeriod: Int = 1) {
        let request = ArticleListRequest(baseUrl: NetworkConstants.host, timePeriod: timePeriod)
        
        networkManager.processRequest(request: request, type: ArticleListResponse.self) { [weak self] result in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async { [weak self] in
                        self?.articles = response.articles ?? []
                    }
                case .failure(let error):
                    print(error)
            }
            
        }
    }
}
