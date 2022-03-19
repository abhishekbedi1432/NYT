//
//  NetworkRequestTests.swift
//  NYTTests
//
//  Created by kbedi on 19/03/2022.
//

import XCTest
@testable import NYT

class NetworkRequestTests: XCTestCase {

    func test_requestUrl() throws {
        
        // Given
        let baseURL = "https://dummy.com"
        let request = ArticleListRequest(baseUrl: baseURL, timePeriod: 5, apiKey: "dummyKey")
        
        let expectedUrlString = "https://dummy.com/v2/mostviewed/all-sections/5.json?api-key=dummyKey"
        
        // When
        let absoluteString = try? XCTUnwrap(request.urlRequest?.url?.absoluteString)
        
        // Then
        XCTAssertEqual(absoluteString, expectedUrlString)
    }
    
    func test_requestUrl_with_incorrect_baseUrl() throws {
        
        // Given
        let baseURL = ""
        
        // When
        let request = ArticleListRequest(baseUrl: baseURL, timePeriod: 5, apiKey: "dummyKey")
        
        // Then
        XCTAssertNil(request.urlRequest)
    }
    
    
    func test_requestUrl_without_params() throws {
        
        // Given
        let baseURL = URL(string: "www.abc.com")!
        
        // When
        let request = URLRequest(baseURL: baseURL, path: nil, parameters: nil)
        
        // Then
        XCTAssertEqual(request?.url, baseURL)
    }
}
