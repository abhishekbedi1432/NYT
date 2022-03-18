//
//  ArticleListCell.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI
import Kingfisher

protocol ArticlePresentable {
    
}


struct ArticleListCell: View {
    var article: Article
    
    struct Constants {
        static let imageWidth: CGFloat = 100
        static let imageHeight: CGFloat = 80
    }


    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            KFImage(article.imageUrlBig).resizable().aspectRatio(contentMode: .fit)
                .frame(maxWidth:Constants.imageWidth, maxHeight: Constants.imageHeight, alignment: .leading)
            VStack(alignment: .leading, spacing: 8, content: {
                
                Text(article.title ?? "").font(.caption).foregroundColor(.gray)
                Text(article.publishedDate ?? "").font(.subheadline)
            })
        }
        .padding(10)
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
