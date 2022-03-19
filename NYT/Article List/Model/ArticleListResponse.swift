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
    
    let id: Int?
    let publishedDate, byline: String?
    let title, abstract: String?
    let media: [Media]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case publishedDate = "published_date"
        case byline, title, abstract, media
    }
}

// MARK: - Media
struct Media: Codable {
    let mediaMetadata: [MediaMetadatum]?
    
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String?
    let format: String?
}
