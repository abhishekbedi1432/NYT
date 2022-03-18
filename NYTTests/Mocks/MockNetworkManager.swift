//
//  NetworkStub.swift
//  NYTTests
//
//  Created by kbedi on 18/03/2022.
//

import Foundation
@testable import NYT

class MockNetworkManager: NetworkContract {
    
    private var mockFile: String
    
    init(withMockFile mockFile: String) {
        self.mockFile = mockFile
    }
    
    func sendRequest<T>(request: NetworkRequest, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        
        let bundle = Bundle(for: MockNetworkManager.self)
        
        guard let filePath = bundle.path(forResource: mockFile, ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
              let result = try? JSONDecoder().decode(T.self, from: data) else {
                  return
              }
        completion(.success(result))
    }
}
