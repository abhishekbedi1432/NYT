//
//  NetworkManagerTests.swift
//  NYTTests
//
//  Created by kbedi on 19/03/2022.
//

import XCTest
@testable import NYT

class NetworkManagerTests: XCTestCase {
    
    var mockSession: URLSessionMock!
    var networkManager: NetworkManager!
    var request: ArticleListRequest!
    
    override func setUpWithError() throws {
        // Given
        mockSession =  URLSessionMock()
        networkManager = NetworkManager(session: mockSession)
        request = ArticleListRequest(timePeriod: 1)
    }
    
    func testNetworkManager() throws {
        // When
        mockSession.data = Data()
        
        let request = ArticleListRequest(timePeriod: 1)
        
        networkManager.processRequest(request: request, type: ArticleListResponse.self) { result in
            // Then
            XCTAssertNotNil(result)
        }
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockSession = nil
        networkManager = nil
        request = nil
    }
}

