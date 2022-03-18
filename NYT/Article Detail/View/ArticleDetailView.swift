//
//  ArticleDetailView.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI

protocol ArticleDetailContract {
    var imageUrl: URL? { get }
    var headline: String { get }
    var author: String { get }
    var content: String { get }
}

struct ArticleDetailView: View {
    //TODO: - Need to use contract here
    var viewModel: ArticleDetailContract!

    var body: some View {

        ScrollView {
            VStack(alignment: .leading) {
                AsyncImageView(imageUrl: viewModel.imageUrl).aspectRatio(contentMode: .fit)
                ArticleDetailCellView(title: viewModel.headline,
                                      subTitle: viewModel.author,
                                      abstract: viewModel.content)
            }.padding()
        }
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://static01.nyt.com/images/2022/03/09/world/09cli-shackleton-handout2/09cli-shackleton-handout2-mediumThreeByTwo440.jpg")
        ArticleDetailView(viewModel: ArticleDetailViewModel(imageUrl: url,
            headline: "Headline", author: "Author", content: "Abstract"))
    }
}
