//
//  NetworkRequestTests.swift
//  NYTTests
//
//  Created by kbedi on 19/03/2022.
//

import XCTest
@testable import NYT


class NetworkRequestTests: XCTestCase {

    var request: ArticleListRequest?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        request = nil
    }

    func test_requestUrl() throws {
        
        // Given
        let baseURL = "https://dummy.com"
        request = ArticleListRequest(baseUrl: baseURL, timePeriod: 5, apiKey: "dummyKey")
        
        let expectedUrlString = "https://dummy.com/v2/mostviewed/all-sections/5.json?api-key=dummyKey"
        
        // When
        let absoluteString = try? XCTUnwrap(request?.urlRequest?.url?.absoluteString)
        
        // Then
        XCTAssertEqual(absoluteString, expectedUrlString)
    }
    
    func test_requestUrl_with_incorrect_baseUrl() throws {
        
        // Given
        let baseURL = ""
        
        // When
        request = ArticleListRequest(baseUrl: baseURL, timePeriod: 5, apiKey: "dummyKey")
        
        // Then
        XCTAssertNil(request?.urlRequest)
    }
}
