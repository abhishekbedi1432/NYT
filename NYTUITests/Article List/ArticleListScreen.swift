//
//  ArticleListScreen.swift
//  NYTUITests
//
//  Created by kbedi on 19/03/2022.
//

import XCTest

protocol Screen {
    var app: XCUIApplication { get }
}

struct ArticleListScreen: Screen {

    let app: XCUIApplication
    
    private enum Identifiers {
        static let title = "email"
        static let password = "password"
        static let login = "login"
        static let error = "error"
    }
        
    func waitForTitleToBeVisible() -> Self {
        XCTAssertTrue(navigationBar.waitForExistence(timeout: Constants.timeout))
        return self
    }
    
    @discardableResult
    func verifyIfArticlesAreLoaded() -> Self {
        XCTAssertTrue(app.cells.count > 0)
        return self
    }
    
//    @discardableResult
//    func verifyIfLastCellIsVisible() -> Self {
//        let cellCount = app.cells.count
//        let lastCellIndex = cellCount - 1
//        return self
//    }
    
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
    
    private var navigationBar: XCUIElement {
        app.navigationBars.firstMatch
    }
}


extension XCTestCase {
    func wait(element: XCUIElement, duration: TimeInterval) {
        let predicate = NSPredicate(format: "exists == true")
        let _ = expectation(for: predicate, evaluatedWith: element, handler: nil)
        
        // We use a buffer here to avoid flakiness with Timer on CI
        waitForExpectations(timeout: duration + 0.5)
    }
}
