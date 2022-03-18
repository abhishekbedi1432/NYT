//
//  ArticleListCell.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI

struct ArticleListCell: View {
    var article: Article
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
//            KFImage(URL(string: article.urlToImage ?? "")).resizable().aspectRatio(contentMode: .fit)
            Text(article.title ?? "").font(.subheadline)
        }
    }
}

struct ArticleListCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListCell(article: dummyArticle)
    }
    
    
    static var dummyArticle: Article {
        Article(id: 1, assetID: 123, source: "NYT", publishedDate: "Today", byline: "Dummy", type: "Feed", title: "Dummy Article", abstract: "This is a dummy article", media: nil)
    }
}
