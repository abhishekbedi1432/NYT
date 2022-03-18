//
//  NetworkError.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

enum NetworkError: Error {
    case serverError(_ error: Error?)
    case invalidData
}

