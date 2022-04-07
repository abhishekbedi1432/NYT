//
//  ArticleListViewModel.swift
//  NYT
//
//  Created by kbedi on 17/03/2022.
//

import Foundation
import SwiftUI

enum RequestState {
    case idle
    case loading
    case failed(Error)
    case loaded
}

class ArticleListViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published private(set) var state = RequestState.idle
    var timePeriod: Int = 1 {
        willSet{
            refreshArticles(period: newValue)
        }
    }
    
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
                            self?.articles = articles
                            self?.state = !articles.isEmpty ? .loaded : .failed(NetworkError.noData)
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
    
    func refreshArticles(period: Int) {
        let request = ArticleListRequest(timePeriod: period)
        networkManager.processRequest(request: request, type: ArticleListResponse.self) { [weak self] result in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async { [weak self] in
                        if let articles = response.articles?.sortedByDate {
                            self?.articles = articles
                        }
                    }
                case .failure(let error):
                    print(error)
                    
            }
        }
    }
}
