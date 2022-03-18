//
//  ArticleListResponse.swift
//  NYT
//
//  Created by kbedi on 17/03/2022.
//

import Foundation

struct ArticleListResponse: Codable {
    let status, copyright: String?
    let numResults: Int?
    let articles: [Article]?
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case articles = "results"
    }
}

// MARK: - Article
struct Article: Codable, Identifiable {    
    
    let id, assetID: Int?
    let source, publishedDate, byline, type: String?
    let title, abstract: String?
    let media: [Media]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case byline, type, title, abstract, media
    }
}

// MARK: - Media
struct Media: Codable {
    let type, subtype, caption: String?
    let mediaMetadata: [MediaMetadatum]?
    
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String?
    let format: String?
    let height, width: Int?
}

extension Article {
    
//    var imageUrl: URL? {
//
//        guard let urlString = media?.first?.mediaMetadata?.first?.url else {
//            return nil
//        }
//
//        return URL(string: urlString)
//    }
    
    var imageUrlBig: URL? {
        guard let urlString = media?.first?.mediaMetadata?.first(where: { $0.format == "mediumThreeByTwo440"})?.url else {
            return nil
        }
        
        return URL(string: urlString)
    }
}


extension Article: ArticleDetailContract {
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
