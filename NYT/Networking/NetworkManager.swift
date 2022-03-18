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

class NetworkManager: NetworkContract {
    
    func sendRequest<T: Codable>(request: NetworkRequest, completion: @escaping(Swift.Result<T, Error>) -> Void) {
        
        URLSession.shared.dataTask(with: request.urlRequest) { data, response, error in
            if let _error = error {
                completion(Result.failure(NetworkError.serverError(_error)))
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
            
            //            guard let data = data, let response = try? JSONDecoder().decode(T.self, from: data) else {
            //                completion(Result.failure(NetworkError.invalidData))
            //                return
            //            }
            //            completion(Result.success(response))
        }.resume()
    }
    
    
//    func makeRequest<T: Codable>(request: NetworkRequest, completion: @escaping ((ServiceResult<T>) -> Void)) {
//        
//        URLSession.shared.dataTask(with: request.urlRequest) { data, response, error in
//            if let _error = error {
//                completion(.failure(NetworkError.serverError(_error)))
//                return
//            }
//            do{
//                let response = try JSONDecoder().decode(T.self, from: data!)
//                completion(.success(response))
//            }
//            catch(let error) {
//                print(error)
//                completion(.failure(NetworkError.invalidData))
//            }
//            
//            //            guard let data = data, let response = try? JSONDecoder().decode(T.self, from: data) else {
//            //                completion(Result.failure(NetworkError.invalidData))
//            //                return
//            //            }
//            //            completion(Result.success(response))
//        }.resume()
//    }

    
    
}
