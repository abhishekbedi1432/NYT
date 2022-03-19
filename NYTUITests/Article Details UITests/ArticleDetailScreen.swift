//
//  ArticleDetailScreen.swift
//  NYTUITests
//
//  Created by kbedi on 19/03/2022.
//

import Foundation
import XCTest

struct ArticleDetailScreen: Screen {
    
    let app: XCUIApplication
    
    private let backButtonTitle = "NY Times Articles"
    
    @discardableResult
    func verifyIfUIElementsAreVisible() -> Self {
        XCTAssertTrue(navigationBar.waitForExistence(timeout: Constants.timeout))
        XCTAssertTrue(navigationBar.exists)
        
        let backButtonTitle = navigationBar.buttons.firstMatch.label
        XCTAssertEqual(backButtonTitle, backButtonTitle)
        
        XCTAssertTrue(image.waitForExistence(timeout: Constants.timeout))

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


private extension ArticleDetailScreen {
    var image: XCUIElement {
        app.scrollViews.firstMatch.otherElements.firstMatch
    }
}
