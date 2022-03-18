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
        VStack {
            
            AsyncImageView(imageUrl: viewModel.imageUrl).aspectRatio(contentMode: .fit)
            
            Form {
                Section {
                    ArticleDetailCellView(title: viewModel.headline,
                                          subTitle: viewModel.author,
                                          abstract: viewModel.content)
                }
            }.accentColor(.secondary)
        }
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(viewModel: ArticleDetailViewModel(headline: "Headline", author: "Author", content: "Abstract"))
    }
}
