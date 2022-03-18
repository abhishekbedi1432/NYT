//
//  ArticleListView.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI

struct ArticleListView<ViewModel>: View where ViewModel : ArticleListContract {

    // MARK: Properties
    @ObservedObject private(set) var viewModel: ViewModel

//    var body: some View {
//        NavigationView {
//            ScrollView {
//
//                ForEach(viewModel.articles) { article in
//                    NavigationLink(destination: articleDetailsView(for: article)) {
//                        ArticleListCell(article: article)
//                    }
//                }
//            }
//            .onLoad {
//                viewModel.fetchArticles()
//            }
//            .navigationTitle(Text("Most popular"))
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.articles) { article in
                    NavigationLink(destination: articleDetailsView(for: article)) {
                        ArticleListCell(article: article)
                    }
                }
            }.onLoad {
                viewModel.fetchArticles()
            }
            .navigationTitle(Text("Most Popular Articles"))
//            .navigationBarTitleDisplayMode(.inline)

        }
        .navigationViewStyle(.stack)
    }

}

private extension ArticleListView {
    
    func articleDetailsView(for article: ArticleDetailContract) -> ArticleDetailView {
        ArticleDetailView(viewModel: article)
    }
}


struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(viewModel: ArticleListViewModel())
    }
}
