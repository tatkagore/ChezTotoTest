//
//  MenuViewUITest.swift
//  Tests
//
//  Created by Tatiana Simmer on 24/11/2023.
//

import XCTest

class MenuViewUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testNavigationToMenuView() {
        let menuButton = app.buttons["Accéder au menu"]
        
        // Tap the button to navigate to the menu view
        menuButton.tap()
        
        // Check if the navigation was successful by verifying elements in the menu view
        XCTAssertTrue(app.navigationBars["Menu"].exists, "Failed to navigate to the Menu view")
        XCTAssertTrue(app.tables.cells.staticTexts["Entrées"].exists, "Entrées section not found in Menu view")
    }
}

