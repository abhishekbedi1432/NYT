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

    //    let repo: ArticleListRepository!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let mockNetworkManager = MockNetworkManager(withMockFile: "nyt_popular_response")
//        let remoteDatasource = ArticleListRemoteDatasource(baseUrl: "dummy", networkManager: mockNetworkManager)
//        let repo = ArticleListRepository(remoteDatasource: remoteDatasource)
        sut = ArticleListViewModel(networkManager: mockNetworkManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

//    func test_article_count() throws {
//
//        // Given
//        let expectedItemsCount = 1
//
//        // When
//        sut.fetchArticles()
//
//        // Then
//        XCTAssertFalse(sut.articles.isEmpty)
//        XCTAssertEqual(sut.articles.count, expectedItemsCount)
//
//        let firstArticle = try XCTUnwrap(sut.articles.first)
//        XCTAssertEqual(firstArticle.title, "At the Bottom of an Icy Sea, One of History’s Great Wrecks Is Found")
//        XCTAssertEqual(firstArticle.byline, "By Henry Fountain")
//        XCTAssertEqual(firstArticle.publishedDate, "2022-03-09")
//    }
    
    
//    func test_first_article() throws {
//        
//        // Given
//        let title = "At the Bottom of an Icy Sea, One of History’s Great Wrecks Is Found"
//        let byline = "By Henry Fountain"
//        let date = "2022-03-09"
//        
//        // When
//        sut.fetchArticles()
//        
//        // Then
//        let firstArticle = try XCTUnwrap(sut.articles.first)
//        XCTAssertEqual(firstArticle.title, title)
//        XCTAssertEqual(firstArticle.byline, byline)
//        XCTAssertEqual(firstArticle.publishedDate, date)
//    }
    
    
    func test_article_response_failure() {
        let mockNetworkManager = MockNetworkManager(withMockFile: "nyt_error_response")
        sut = ArticleListViewModel(networkManager: mockNetworkManager)
        
        // When
        sut.fetchArticles()

        // Then
        XCTAssertTrue(sut.articles.isEmpty)
    }
}
