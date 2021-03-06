//
//  NetworkRequestTests.swift
//  NYTTests
//
//  Created by kbedi on 19/03/2022.
//

import XCTest
@testable import NYT

class NetworkRequestTests: XCTestCase {
    
    var request: NetworkRequest!
    
    override func setUpWithError() throws {
        request = ArticleListRequest(timePeriod: 5)
    }
    
    func test_RequestUrl() throws {
        
        // Given
        let expectedUrlString = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/5.json?api-key=7AP916lfRg6y1NCiz6kqyqH1v9CIB3ah"
        
        // When
        let absoluteString = try? XCTUnwrap(request.urlRequest?.url?.absoluteString)
        
        // Then
        XCTAssertEqual(absoluteString, expectedUrlString)
    }
    
    func test_RequestHeaderParams() throws {
        // Given
        let expectedHeaderParams = 0
        // When
        let requestHeader = request.headerParams
        // Then
        XCTAssertEqual(requestHeader.count, expectedHeaderParams)
    }
    
    func test_RequestParamsValues() throws {
        
        let headerValue = try XCTUnwrap(request.params.first?.value)
        XCTAssertNotNil(headerValue)
    }
    
    func test_RequestAPIKeys() throws {
        let apiKey = request.apiKey
        XCTAssertEqual(NetworkConstants.apiKey, apiKey)
    }
    
    override func tearDownWithError() throws {
        request = nil
    }
}
