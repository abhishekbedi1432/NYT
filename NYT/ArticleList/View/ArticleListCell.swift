//
//  ArticleListCell.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI
import Kingfisher

struct ArticleListCell: View {
    var article: Article
    
    struct Constants {
        static let imageWidth: CGFloat = 100
        static let imageHeight: CGFloat = 80
    }
    
//    var body: some View {
//        HStack(alignment: .center, spacing: 15) {
//            KFImage(article.imageUrl).resizable().aspectRatio(contentMode: .fit)
//            Text(article.title ?? "").font(.subheadline)
//        }
//    }

    // V stack
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            KFImage(article.imageUrlBig).resizable().aspectRatio(contentMode: .fit)
            VStack(alignment: .leading, spacing: 8, content: {
                
                Text(article.title ?? "").font(.caption)
                Text(article.publishedDate ?? "").font(.subheadline)
            })
        //TODO: - Need to extract this.
            Image(systemName: "chevron.forward")
                .font(Font.system(.caption).weight(.bold))
                .foregroundColor(Color(UIColor.tertiaryLabel))
        }
        .padding(10)
    }
        
    

    
    
    
//    var body: some View {
//        HStack(spacing: 8) {
//            KFImage(article.imageUrl).aspectRatio(contentMode: .fit)
////            AsyncImageView(imageUrl: URL(string: article.media?.first?.mediaMetadata?.first?.url ?? ""))
//                .frame(width: Constants.imageWidth, height: Constants.imageHeight)
//
////                .aspectRatio(contentMode: .fill)
//
//            Text(article.title ?? "").font(.subheadline)
//        }
//    }
}

struct ArticleListCell_Previews: PreviewProvider {

    static var previews: some View {
        ArticleListCell(article: dummyArticle)
    }
    
    static var dummyArticle: Article {
        Article(id: 1, assetID: 123, source: "NYT", publishedDate: "Today", byline: "Dummy", type: "Feed", title: "Dummy Article", abstract: "This is a dummy article", media: nil)
    }
}
