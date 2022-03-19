//
//  Article+Extension.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

fileprivate extension String {
    static let thumbnail = "Standard Thumbnail"
    static let banner = "mediumThreeByTwo440"
    static let serverFormat = "YYYY-MM-DD"
    static let userFriendlyFormat = "EEE, MMM d"
}

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
        
        guard let urlString = media?.first?.mediaMetadata?.first(where: { $0.format == .banner })?.url else {
            return nil
        }

        return URL(string: urlString)
    }
    
    var thumbnailUrl: URL? {
        
        guard let urlString = media?.first?.mediaMetadata?.first(where: { $0.format == .thumbnail })?.url else {
            return nil
        }
        
        return URL(string: urlString)
    }
    
    var formattedDate: String {
        guard let publishedDate = publishedDate else {
            return ""
        }
        return publishedDate.getFormattedDate() ?? ""
    }
}


private extension String {
    
    func getFormattedDate(currentFormat: String = .serverFormat,
                          expectedFormat: String = .userFriendlyFormat) -> String? {
        // EEE, MMM d
        let formatter = DateFormatter()
        formatter.dateFormat = currentFormat

        let date = formatter.date(from: self) ?? Date()
        
        formatter.dateFormat = expectedFormat
        return formatter.string(from: date)
    }
    
}
