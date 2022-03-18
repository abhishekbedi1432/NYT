//
//  NetworkRequest.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

protocol NetworkRequest {
    var urlRequest: URLRequest { get }
}
