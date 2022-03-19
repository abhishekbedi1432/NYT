//
//  ArticleListScreen.swift
//  NYTUITests
//
//  Created by kbedi on 19/03/2022.
//

import XCTest

struct ArticleListScreen: Screen {

    let app: XCUIApplication
    
    @discardableResult
    func waitForTitleToBeVisible() -> Self {
        XCTAssertTrue(navigationBar.waitForExistence(timeout: Constants.timeout))
        return self
    }
    
    @discardableResult
    func tapOnFirstArticle() -> ArticleDetailScreen {
        let firstCell = app.cells.firstMatch
        firstCell.tap()
        return ArticleDetailScreen(app: app)
    }
    
    @discardableResult
    func verifyIfArticlesAreLoaded() -> Self {
        XCTAssertTrue(app.cells.count > 0)
        return self
    }
        
    @discardableResult
    func scrollTheList() -> Self {
        app.swipeUp()
        return self
    }
    
    @discardableResult
    func verifyTitle(_ text: String) -> Self {
        XCTAssertEqual(navigationBar.identifier, text)
        return self
    }
}

private extension ArticleListScreen {
    var navigationBar: XCUIElement {
        app.navigationBars.firstMatch
    }
}
