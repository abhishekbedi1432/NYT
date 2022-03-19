//
//  ArticleListTests.swift
//  NYTTests
//
//  Created by kbedi on 18/03/2022.
//

import XCTest
@testable import NYT

class ArticleListTests: XCTestCase {

    var sut: ArticleListViewModel!
    
    override func setUpWithError() throws {

        let mockNetworkManager = MockNetworkManager(withMockFile: "nyt_popular_response")
        sut = ArticleListViewModel(networkManager: mockNetworkManager)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

}
