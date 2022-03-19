//
//  URLSessionMock.swift
//  NYTTests
//
//  Created by kbedi on 19/03/2022.
//

import Foundation
@testable import NYT

class URLSessionMock: URLSessionBuildable {
    
    var data: Data?
    var error: Error?
    var response: URLResponse?
    func fetchDataTask(with: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completion(data, response, error)
    }
}
