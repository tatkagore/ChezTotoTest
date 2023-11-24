//
//  Tests.swift
//  Tests
//
//  Created by Tatiana Simmer on 23/11/2023.
//

import XCTest

@testable import ChezToto

final class Tests: XCTestCase {
    
    var viewModel: ViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = ViewModel() // Initialize the viewModel before each test
    }
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testSuccessfulRemoveDish() {
        // Given
        viewModel.menuArray = [
            TypeOfDish(name: "Appetizers", dishs: [
                Dish(name: "Salad", description: "Healthy", price: 5.99)
            ])
        ]
        
        // When
        viewModel.removeDish(dishName: "Salad")
        
        // Then
        XCTAssertEqual(viewModel.menuArray.first?.dishs.count, 0, "Dish should have been removed.")
    }
    
    func testSuccessfulAddDish() {
        // Given
        viewModel.menuArray = [
            TypeOfDish(name: "Appetizers", dishs: [])
        ]
        
        let newDish = Dish(name: "Pizza", description: "Delicious", price: 10.99)
        
        // When
        viewModel.addDish(dish: newDish, typeOfDish: "Appetizers")
        
        // Then
        XCTAssertEqual(viewModel.menuArray.first?.dishs.count, 1, "Dish should have been added.")
        XCTAssertEqual(viewModel.menuArray.first?.dishs.first?.name, "Pizza", "Added dish name should match.")
        XCTAssertEqual(viewModel.menuArray.first?.dishs.first?.description, "Delicious", "Added dish description should match.")
        XCTAssertEqual(viewModel.menuArray.first?.dishs.first?.price, 10.99, "Added dish price should match.")
    }
    
    func testSuccessfulAddNewTypeOfDish() {
        // Given
        viewModel.menuArray = [
            TypeOfDish(name: "Appetizers", dishs: []),
            TypeOfDish(name: "Desserts", dishs: [])
        ]
        
        // When
        viewModel.addNewTypeOfDish(typeOfDish: "Beverages")
        
        // Then
        XCTAssertEqual(viewModel.menuArray.count, 3, "A new type of dish should have been added.")
        XCTAssertEqual(viewModel.menuArray.last?.name, "Beverages", "Added dish type name should match.")
        XCTAssertEqual(viewModel.menuArray.last?.dishs.count, 0, "Added dish type should have an empty dish array.")
    }
}
