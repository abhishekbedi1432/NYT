//
//  ArticleListViewModel.swift
//  NYT
//
//  Created by kbedi on 17/03/2022.
//

import Foundation

class ArticleListViewModel: ObservableObject {
    
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([Article])
    }
    
    @Published var articles: [Article] = []
    @Published private(set) var state = State.idle
    @Published var timePeriod: Int
    
    private let networkManager: NetworkManager
    
    //MARK: - Initializer
    init(networkManager: NetworkManager = NetworkManager(), timePeriod: Int = 1 ) {
        self.networkManager = networkManager
        self.timePeriod = timePeriod
    }
    
    func fetchArticles() {
        
        state = .loading
        
        let request = ArticleListRequest(timePeriod: timePeriod)
        
        networkManager.processRequest(request: request, type: ArticleListResponse.self) { [weak self] result in
            
            switch result {
                case .success(let response):
                    DispatchQueue.main.async { [weak self] in
                        if let articles = response.articles?.sortedByDate {
                            self?.articles = response.articles?.sortedByDate ?? []
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
