//
//  ArticleListCell.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI
import Kingfisher

struct ArticleListCell: View {
    var article: ArticleListPresentable
    
    // MARK: Constants
    struct Constants {
        static let imageWidth: CGFloat = 100
        static let imageHeight: CGFloat = 100
        static let padding: CGFloat = 8
        static let spacing: CGFloat = 12
    }

    var body: some View {
        HStack(alignment: .top, spacing: Constants.spacing) {
           
            // MARK: ImageView
            KFImage(article.imageUrl).resizable().aspectRatio(contentMode: .fit)
                .frame(maxWidth:Constants.imageWidth, maxHeight: Constants.imageHeight, alignment: .leading)
            
            // MARK: Title / Subtitle
            VStack(alignment: .leading, spacing: Constants.spacing, content: {
                
                Text(article.headline).font(.caption)
                Text(article.author).font(.caption2).foregroundColor(.gray)
                HStack(alignment: .center, spacing: Constants.spacing) {
//                    Text(article.author).font(.caption2).foregroundColor(.gray)
                    Image(systemName: "calendar.circle.fill")
                    Text(article.date).font(.caption2).foregroundColor(.gray)
                }
                
            })
        }
        .padding(Constants.padding)
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
