//
//  ArticleListView.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI

struct ArticleListView<ViewModel>: View where ViewModel: ArticleListContract {
    
    // MARK: Constants
    private let screenTitle = LocalizedStringKey("article_screen_title")
    @State private var showModal: Bool = false
    @State var selectedPeriodRange: ArticlePeriodOption = .daily

    // MARK: Properties
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.articles) { article in
                    NavigationLink(destination: articleDetailsView(for: article)) {
                        ArticleListCell(article: article)
                    }
                }
            }.onLoad {
                viewModel.fetchArticles(withRange: selectedPeriodRange.rawValue)
            }
            .navigationTitle(Text(screenTitle))
            .listRowBackground(Color.clear)
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing:
                                    Button(action: { self.showModal = true }) {
                HStack(){
                    Text(selectedPeriodRange.value)
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
                
            }.sheet(isPresented: self.$showModal) {
                NavigationView {
                    ArticlePeriodView(selectedPeriodRange: self.$selectedPeriodRange,
                                      showModal: self.$showModal,
                                      viewModel: viewModel)
                }
            }
            )
        }
        .navigationViewStyle(.stack)
    }
}


// MARK: Article Details
private extension ArticleListView {
    
    func articleDetailsView(for article: ArticlePresentable) -> ArticleDetailView {
        ArticleDetailView(viewModel: article)
    }
}


struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(viewModel: ArticleListViewModel())
    }
}

struct ArticleView: View {
    @ObservedObject var viewModel: ArticleLoaderViewModel
    @State var selectedPeriodRange: ArticlePeriodOption = .daily
    var body: some View {
        switch viewModel.state {
            case .idle:
                // Render a clear color and start the loading process
                // when the view first appears, which should make the
                // view model transition into its loading state:
                
                Color.clear.onAppear(perform: viewModel.fetchArticles)
            case .loading:
                PlaceholderView()
                
            case .failed(let error):
                ErrorView(error: error, retryAction: viewModel.fetchArticles)
                
            case .loaded(let articles):
                ListView(articles: articles)
        }
    }
}


struct ListView: View {
    
    private let screenTitle = LocalizedStringKey("article_screen_title")
    
    var articles: [Article]
    
    @State private var showModal: Bool = false
    @State var selectedPeriodRange: ArticlePeriodOption = .daily

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
            .navigationBarItems(trailing:
                                    Button(action: { self.showModal = true }) {
                HStack(){
                    Text(selectedPeriodRange.value)
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
                
            }.sheet(isPresented: self.$showModal) {
                NavigationView {
//                    ArticlePeriodView(selectedPeriodRange: self.$selectedPeriodRange,
//                                      showModal: self.$showModal,
//                                      viewModel: viewModel)
                }
            }
            )
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
