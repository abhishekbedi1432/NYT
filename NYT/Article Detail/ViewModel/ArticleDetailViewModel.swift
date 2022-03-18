//
//  ArticleDetailViewModel.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import Foundation

struct ArticleDetailViewModel : ArticleDetailContract {
    var imageUrl: URL?
    var headline: String
    var author: String
    var content: String
}
