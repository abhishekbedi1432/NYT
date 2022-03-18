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

    var body: some View {
        NavigationView {
            ScrollView {
                
                // MARK: GRID
                ForEach(viewModel.articles) { article in
                    NavigationLink(destination: articleDetailsView(for: article)) {
                        
                        // MARK: ItemView
                        ArticleListCell(article: article)
                        
//                        (product: product,
//                                        isInWishList: viewModel.isProductInWishList(product: product),
//                                        onWishListTap: { product in
//                            viewModel.handleWishListTapFor(product: product)
//                        })
                    }
                }
                
            }
            .onLoad {
                viewModel.fetchArticles()
            }
            .navigationTitle("Most popular")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

private extension ArticleListView {
    func articleDetailsView(for article: Article) -> ArticleDetailView {
        return ArticleDetailView()
//        let productDetailsViewModel = ProductDetailsViewModel(product: product, cart: cart, wishList: wishList)
//        return ProductDetailsView(viewModel: productDetailsViewModel)
    }
}


struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(viewModel: ArticleListViewModel())
    }
}
