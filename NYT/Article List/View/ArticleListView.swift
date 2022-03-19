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
                
            case .loaded:
                ListView(viewModel: viewModel)
        }
    }
}


struct ListView: View {
    
    private let screenTitle = LocalizedStringKey("article_screen_title")
    
    @ObservedObject var viewModel: ArticleListViewModel
    
    @State private var showModal: Bool = false
    @State var selectedPeriodRange: ArticlePeriodOption = .daily
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.articles) { article in
                    NavigationLink(destination: articleDetailsView(for: article)) {
                        ArticleListCell(article: article)
                    }
                }
            }
            .navigationBarItems(trailing: HStack {
                Button(action: {self.showModal = true}) {
                    HStack(alignment: .center) {
                        Text(self.selectedPeriodRange.value)
                        Image(systemName: "clock.arrow.2.circlepath")
                            .padding(.leading, 10.0)
                    }
                }
            }.sheet(isPresented: self.$showModal) {
                NavigationView {
                    ArticlePeriodView(selectedPeriodRange: self.$selectedPeriodRange, showModal: self.$showModal, viewModel: viewModel)
                }
            })
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
