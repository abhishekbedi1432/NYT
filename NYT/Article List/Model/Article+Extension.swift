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
    
    var calendarDate: String {
        publishedDate ?? ""
    }
}
