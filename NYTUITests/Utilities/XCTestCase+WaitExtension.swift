//
//  XCTestCase+WaitExtension.swift
//  NYTUITests
//
//  Created by kbedi on 19/03/2022.
//

import XCTest

extension XCTestCase {
    func wait(element: XCUIElement, duration: TimeInterval) {
        let predicate = NSPredicate(format: "exists == true")
        let _ = expectation(for: predicate, evaluatedWith: element, handler: nil)
        
        // We use a buffer here to avoid flakiness with Timer on CI
        waitForExpectations(timeout: duration + 0.5)
    }
}

extension UITestCase {
    
    
}
