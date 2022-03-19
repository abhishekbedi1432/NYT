//
//  ArticleListTests.swift
//  NYTTests
//
//  Created by kbedi on 18/03/2022.
//

import XCTest
@testable import NYT

class ArticleListTests: XCTestCase {

    var viewModel: ArticleListViewModel!
    
    override func setUpWithError() throws {

        let mockNetworkManager = MockNetworkManager(withMockFile: "nyt_popular_response")
        viewModel = ArticleListViewModel(networkManager: mockNetworkManager)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func test_article_response_failure() {
        let mockNetworkManager = MockNetworkManager(withMockFile: "nyt_error_response")
        viewModel = ArticleListViewModel(networkManager: mockNetworkManager)
        
        // When
        viewModel.fetchArticles()
        
        // Then
        XCTAssertTrue(viewModel.articles.isEmpty)
    }
    
}
