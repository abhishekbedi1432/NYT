//
//  URLSessionTests.swift
//  NYTTests
//
//  Created by kbedi on 19/03/2022.
//

import XCTest
@testable import NYT

class URLSessionTests: XCTestCase {
    
    var mockSession:  URLSessionMock!
    var networkManager: NetworkManager!
    var request: ArticleListRequest!
    var urlSession: URLSession!
    
    override func setUpWithError() throws {
        // Given
        mockSession =  URLSessionMock()
        urlSession = URLSession.shared
        networkManager = NetworkManager(session: mockSession)
        request = ArticleListRequest(timePeriod: 1)
    }
    
    func test_DataTaskURL() {
        // When
        urlSession.dataTask(with: request.urlRequest!) { data, response, error in
            // Then
            XCTAssertNotNil(response)
        }
    }
    
    func test_RequestBaseURL() {
        let request = MockNetworkRequest()
        XCTAssertNotNil(request.urlRequest)
    }
    
    func test_SessionRequestData() throws {
        // When
        mockSession.data = Data()
        
        mockSession.fetchDataTask(with: request.urlRequest!) { data, response, error in
            //Then
            XCTAssertNotNil(data)
            XCTAssertNil(response)
            XCTAssertNil(error)
        }
    }
    
    func test_SessionRequestError() throws {
        // When
        mockSession.error = NetworkError.noData
        mockSession.fetchDataTask(with: request.urlRequest!) { data, response, error in
            // Then
            XCTAssertNotNil(error)
        }
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockSession = nil
        networkManager = nil
        request = nil
        urlSession = nil
    }
}
