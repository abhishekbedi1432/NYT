//
//  ArticleListTests.swift
//  NYTUITests
//
//  Created by kbedi on 19/03/2022.
//

import XCTest

class ArticleListTests: UITestCase {

    func test_navigationTitle_is_Visible() {
        ArticleListScreen(app: app)
            .waitForTitleToBeVisible()
            .verifyTitle("NY Times Articles")
    }
    
    func test_articles_have_loaded() {
        ArticleListScreen(app: app)
            .waitForTitleToBeVisible()
            .verifyIfArticlesAreLoaded()
    }
    
    func test_list_is_scrollable() {
        ArticleListScreen(app: app)
            .waitForTitleToBeVisible()
            .scrollUp()
            .scrollUp()
            .verifyIfArticlesAreLoaded()
    }
    
    func testArticleDetailIsVisible() {
        let listScreen = ArticleListScreen(app: app)
        listScreen.waitForTitleToBeVisible()
        
        let detailScreen = listScreen.tapOnFirstArticle()
        detailScreen.scrollUp()
        detailScreen.verifyIfUIElementsAreVisible()
    }

}
