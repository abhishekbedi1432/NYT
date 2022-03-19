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
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockSession =  URLSessionMock()
        urlSession = URLSession.shared
        networkManager = NetworkManager(session: mockSession)
        request = ArticleListRequest(timePeriod: 1)
    }
    
    func testDataTaskURL() {        
        urlSession.dataTask(with: request.urlRequest!) { data, response, error in
            XCTAssertNotNil(response)
        }
    }
    
    func testRequestBaseURL() {
        let request = MockNetworkRequest()
        XCTAssertNotNil(request.urlRequest)
    }
    
    func testSessionRequestData() throws {
        mockSession.data = Data()
        mockSession.fetchDataTask(with: request.urlRequest!) { data, response, error in
            XCTAssertNotNil(data)
            XCTAssertNil(response)
            XCTAssertNil(error)
        }
    }
    
    func testSessionRequestError() throws {
        mockSession.error = NetworkError.noData
        mockSession.fetchDataTask(with: request.urlRequest!) { data, response, error in
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
