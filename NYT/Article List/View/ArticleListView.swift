//
//  ArticleListView.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI

struct ArticleListView: View {
    
    //MARK: - Properties
    @ObservedObject var viewModel: ArticleListViewModel
    @State var selectedPeriodRange: ArticlePeriodOption = .daily
    
    var body: some View {
        switch viewModel.state {
            case .idle:
                Color.clear.onAppear(perform: viewModel.fetchArticles)
                
            case .loading:
                PlaceholderView()
                
            case .failed(let error):
                ErrorView(error: error, retryAction: viewModel.fetchArticles)
                
            case .loaded(let articles):
                ListView(articles: articles, viewModel: viewModel)
        }
    }
}


struct ListView: View {
    
    private let screenTitle = LocalizedStringKey("article_screen_title")
    
    var articles: [Article]
    
    @ObservedObject var viewModel: ArticleListViewModel
    
    @State private var showModal: Bool = false
    @State var selectedPeriodRange: ArticlePeriodOption = .daily
    //    @State var selectedPeriodRange: ArticlePeriodOption = .daily
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articles) { article in
                    NavigationLink(destination: articleDetailsView(for: article)) {
                        ArticleListCell(article: article)
                    }
                }
            }
            .navigationTitle(Text(screenTitle))
            .listRowBackground(Color.clear)
            .listStyle(GroupedListStyle())
        }
        .navigationViewStyle(.stack)
    }
}

// MARK: Article Details
private extension ListView {
    
    func articleDetailsView(for article: ArticlePresentable) -> ArticleDetailView {
        ArticleDetailView(viewModel: article)
    }
}
