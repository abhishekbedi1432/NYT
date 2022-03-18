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
}

extension Article: ArticleListPresentable {
    
    var date: String {
        
        guard let publishedDate = publishedDate else {
            return ""
        }
        return publishedDate //.getFormattedDate()
        //        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "YY-MM-DD"
        //
        //        guard let date1 = dateFormatter.date(from: publishedDate) else { return "" }
        //
        //        dateFormatter.dateStyle = .short
        //        return dateFormatter.string(from: date1)
    }
}

extension Article: ArticleDetailPresentable {
    
    
}


private extension String {
    func getFormattedDate(currentFormat: String = "YY-MM-DD",
                          expectedFormat: String = "EEEE, MMM d, yyyy") -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = currentFormat
        
        let date : Date = dateFormatterGet.date(from: self) ?? Date()
        
        dateFormatterGet.dateFormat = expectedFormat
        return dateFormatterGet.string(from: date)
    }
    
}
