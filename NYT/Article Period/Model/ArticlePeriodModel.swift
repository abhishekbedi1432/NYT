//
//  ArticlePeriodModel.swift
//  NYT
//
//  Created by kbedi on 20/03/2022.
//

import Foundation

struct ArticlePeriodModel {
    var id: Int
    var title: String
    var type: ArticlePeriodOption
}


enum ArticlePeriodOption: Int, CaseIterable {
    case daily =  1
    case weekly = 7
    case monthly = 30
    
    var value: String {
        switch self {
            case .daily:
                return "Day"
            case .weekly:
                return "Weekly"
            case .monthly:
                return "Monthly"
        }
    }
}
