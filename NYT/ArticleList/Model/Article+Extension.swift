//
//  Article+Extension.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

extension Article: ArticlePresentable {

    var author: String {
        byline ?? ""
    }
    var headline: String {
        self.title ?? ""
    }

    var content: String {
        abstract ?? ""
    }

    var imageUrl: URL? {
        
        guard let urlString = media?.first?.mediaMetadata?.first(where: { $0.format == "mediumThreeByTwo440"})?.url else {
            return nil
        }

        return URL(string: urlString)
    }
    
    var thumbnailUrl: URL? {
        
        guard let urlString = media?.first?.mediaMetadata?.first(where: { $0.format == "Standard Thumbnail"})?.url else {
            return nil
        }
        
        return URL(string: urlString)
    }
    
    var date: String {
        guard let publishedDate = publishedDate else {
            return ""
        }
        return publishedDate.getFormattedDate()
    }
}


private extension String {
    func getFormattedDate(currentFormat: String = "YY-MM-DD",
                          expectedFormat: String = "EEE, MMM d") -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = currentFormat
        
        let date : Date = dateFormatterGet.date(from: self) ?? Date()
        
        dateFormatterGet.dateFormat = expectedFormat
        return dateFormatterGet.string(from: date)
    }
    
}
