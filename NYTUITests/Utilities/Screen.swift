//
//  Screen.swift
//  NYTUITests
//
//  Created by kbedi on 19/03/2022.
//

import XCTest

protocol Screen {
    var app: XCUIApplication { get }
}

extension Screen {
    
    @discardableResult
    func scrollUp() -> Self {
        app.swipeUp()
        return self
    }
    
    var navigationBar: XCUIElement {
        app.navigationBars.firstMatch
    }
}
