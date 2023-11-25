//
//  RowViewUITest.swift
//  Tests
//
//  Created by Tatiana Simmer on 25/11/2023.
//

import XCTest
@testable import ChezToto
import SwiftUI

final class RowViewUITest: XCTestCase {
    let app = XCUIApplication()

      override func setUpWithError() throws {
          continueAfterFailure = false
          app.launch()
      }

    override func tearDownWithError() throws {}
    
    func testRowViewDisplay() {
           
           let menuLink = app.buttons["Accéder au menu"]
           menuLink.tap()
           
           let dishName = "Potatoes"
           XCTAssertTrue(app.staticTexts["\(dishName)"].exists, "Le nom du plat n'est pas affiché")
       }

    func testRowViewElements() {
        let dish = Dish(name: "Pizza", description: "Delicious pizza", pictureName: "pizza_image", price: 9.99)
        
        let rowView = RowView(dish: dish)
        let contentView = UIHostingController(rootView: rowView)
        
        XCTAssertNotNil(contentView.view, "RowView should not be nil")
        
        let imageView = contentView.view?.subviews.compactMap { $0 as? UIImageView }.first
        XCTAssertNotNil(imageView, "Image view should exist")
        
        let nameText = contentView.view?.subviews.compactMap { $0 as? UILabel }
            .first(where: { $0.text == dish.name })
        XCTAssertNotNil(nameText, "Name text label should exist with correct text")
        
        let descriptionText = contentView.view?.subviews.compactMap { $0 as? UILabel }
            .first(where: { $0.text == dish.description })
        XCTAssertNotNil(descriptionText, "Description text label should exist with correct text")
        
        let priceText = contentView.view?.subviews.compactMap { $0 as? UILabel }
            .first(where: { $0.text == String(format: "%g €", dish.price) })
        XCTAssertNotNil(priceText, "Price text label should exist with correct text")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
