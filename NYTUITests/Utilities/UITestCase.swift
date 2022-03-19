//
//  UITestCase.swift
//  NYTUITests
//
//  Created by kbedi on 19/03/2022.
//

import XCTest

class UITestCase: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .deleteOnSuccess
        add(attachment)
        app.terminate()
    }

}
