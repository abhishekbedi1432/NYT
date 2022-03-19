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
    
    @Published var articles: [Article] = []
    
    private let networkManager: NetworkContract

    init(networkManager: NetworkContract = URLSession.shared) {
        self.networkManager = networkManager
    }

    func fetchArticles(withRange timePeriod: Int = 1) {
        
        let request = ArticleListRequest(baseUrl: NetworkConstants.host, timePeriod: timePeriod, apiKey: NetworkConstants.apiKey)
        
        networkManager.processRequest(request: request, type: ArticleListResponse.self) { [weak self] result in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async { [weak self] in
                        self?.articles = response.articles?.sortedByDate ?? []
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}



class ArticleLoaderViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([Article])
    }
    
    @Published private(set) var state = State.idle
    
    private let networkManager: NetworkContract

    var timePeriod: Int = 1
    
    init(networkManager: NetworkContract = URLSession.shared) {
        self.networkManager = networkManager
    }
    
    func fetchArticles() {
        state = .loading
        let request = ArticleListRequest(baseUrl: NetworkConstants.host, timePeriod: timePeriod, apiKey: NetworkConstants.apiKey)
        networkManager.processRequest(request: request, type: ArticleListResponse.self) { [weak self] result in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async { [weak self] in
                        if let articles = response.articles?.sortedByDate {
                            self?.state = !articles.isEmpty ? .loaded(articles) : .failed(NetworkError.noData)
                        }
                        else {
                            self?.state = .failed(NetworkError.noData)
                        }
                    }
                case .failure(let error):
                    self?.state = .failed(error)
                    print(error)
            }
        }
    }
}
