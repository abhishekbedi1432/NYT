//
//  ArticleListView.swift
//  NYT
//
//  Created by kbedi on 18/03/2022.
//

import SwiftUI

struct ArticleListView<ViewModel>: View where ViewModel: ArticleListContract {
    
    // MARK: Constants
    private let screenTitle = "NY Times Articles"
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
