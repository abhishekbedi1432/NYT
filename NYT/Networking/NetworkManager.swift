//
//  NetworkManager.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

enum ServiceResult<T: Codable> {
    case success(T)
    case failure(Error)
}

enum NetworkError: Error {
    case serverError(_ error: Error?)
    case invalidData
}

protocol NetworkContract {
    func sendRequest<T: Codable>(request: NetworkRequest, completion: @escaping(Swift.Result<T, Error>) -> Void)
//    func makeRequest<T: Codable>(request: NetworkRequest, completion: @escaping ((ServiceResult<T>) -> Void))
}


extension URLSession: NetworkContract {
    func sendRequest<T: Codable>(request: NetworkRequest, completion: @escaping (Result<T, Error>) -> Void) {
        
        dataTask(with: request.urlRequest) { data, response, error in
            if let _error = error {
                completion(Result.failure(NetworkError.serverError(_error)))
                return
            }
            do{
                let response = try JSONDecoder().decode(T.self, from: data!)
                
                DispatchQueue.main.async {
                    completion(Result.success(response))
                }
                
            }
            catch(let error) {
                print(error)
                DispatchQueue.main.async {
                    completion(Result.failure(NetworkError.invalidData))
                }
            }
        }.resume()
    }
}
