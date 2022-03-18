//
//  NetworkContract.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

protocol NetworkContract {
    func processRequest<T: Codable>(request: NetworkRequest, type: T.Type, completion: @escaping(Swift.Result<T, Error>) -> Void)
}

extension URLSession: NetworkContract {
    
    func processRequest<T: Codable>(request: NetworkRequest, type: T.Type, completion: @escaping(Swift.Result<T, Error>) -> Void) {
        
        dataTask(with: request.urlRequest) { data, response, error in
            if let error = error {
                completion(Result.failure(NetworkError.serverError(error)))
                return
            }
            do{
                let response = try JSONDecoder().decode(T.self, from: data!)
                completion(Result.success(response))
                
            }
            catch(let error) {
                print(error)
                completion(Result.failure(NetworkError.invalidData))
            }
        }.resume()
    }

}
