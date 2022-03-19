//
//  ArticleDetailViewModel.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

struct ArticleDetailViewModel: ArticlePresentable {
    
    var headline: String
    var calendarDate: String
    var author: String
    var content: String
    var thumbnailUrl: URL?
    var imageUrl: URL?
}
