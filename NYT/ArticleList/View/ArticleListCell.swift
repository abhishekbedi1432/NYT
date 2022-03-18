//
//  ArticleListCell.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI
import Kingfisher

struct ArticleListCell: View {
    
    var article: ArticlePresentable
    
    // MARK: Constants
    struct Constants {
        static let imageWidth: CGFloat = 75
        static let imageHeight: CGFloat = 75
        static let spacing: CGFloat = 12
    }
    
    var body: some View {
        HStack(alignment: .center) {
            // MARK: ImageView
            
            KFImage(article.thumbnailUrl)
                .frame(width: Constants.imageWidth, height: Constants.imageHeight, alignment: .leading)
                .clipShape(Circle())
            
            // MARK: Title / Subtitle
            VStack(alignment: .leading) {
                Text(article.headline).font(.caption)
                    .lineLimit(2)
                    .padding(.bottom, 5.0)
                
                HStack(alignment: .center){
                    Text(article.author)
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                    HStack() {
                        Spacer()
                        Image(systemName: "calendar")
                        Text(article.date)
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            }
            Spacer()
        }.padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
    }
}

struct ArticleListCell_Previews: PreviewProvider {
    
    static var previews: some View {
        ArticleListCell(article: dummyArticle)
    }
    
    static var dummyArticle: Article {
        
        let mediaMetaDatum:[MediaMetadatum] = [MediaMetadatum(url: "https://static01.nyt.com/images/2022/03/09/world/09cli-shackleton-handout2/09cli-shackleton-handout2-thumbStandard.jpg", format: "mediumThreeByTwo440", height: 75, width: 75)]
        
        let media:[Media] = [Media(type: nil, subtype: nil, caption: nil, mediaMetadata: mediaMetaDatum)]
        
        return Article(id: 1, assetID: 123, source: "NYT", publishedDate: "Today", byline: "AUTHOR --- Dummy  ssfkskjessfkskjessfkskjessfkskjessfkskje", type: "Feed", title: "Dummy Articlddddddddddddddddddd ssookokodfjkjskdjfksjkjksdjfksjdkfjskdjfkskje sdfjksjdfksjdkfjsdlk", abstract: "This is a dummy article", media: media)
    }
}
