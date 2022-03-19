//
//  ArticleDetailView.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI

struct ArticleDetailView: View {
    
    var viewModel: ArticlePresentable
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                AsyncImageView(imageUrl: viewModel.imageUrl)
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.top)
                ArticleDetailCellView(title: viewModel.headline,
                                      subTitle: viewModel.author,
                                      abstract: viewModel.content)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://static01.nyt.com/images/2022/03/09/world/09cli-shackleton-handout2/09cli-shackleton-handout2-mediumThreeByTwo440.jpg")
        
        let viewModel = ArticleDetailViewModel(
            headline: "Headline Headline Headline Headline Headline Headline Headline Headline Headline ",
            calendarDate: "2022-03-18",
            author: "Author Author Author Author Author Author",
            content: "Abstract", imageUrl: url)
        
        ArticleDetailView(viewModel: viewModel)
    }
}
