//
//  Article+Date.swift
//  NYT
//
//  Created by kbedi on 19/03/2022.
//

import Foundation

extension Article {
    var date: Date? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "YY-MM-DD"
        
        guard let publishedDate = publishedDate,
              let date = dateFormatterGet.date(from: publishedDate) else {
                  return nil
              }
        return date
    }
}

extension Array where Element == Article {
    
    var sortedByDate: [Article] {
        return self.sorted { firstArticle, secondArticle in
            return firstArticle.date ?? Date() > secondArticle.date ?? Date()
        }
    }
}
