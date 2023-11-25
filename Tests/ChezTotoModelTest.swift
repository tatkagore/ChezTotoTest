//
//  ChezTotoModelTest.swift
//  Tests
//
//  Created by Tatiana Simmer on 24/11/2023.
//

import XCTest
@testable import ChezToto

final class ChezTotoModelTest: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testLoadDecodableFromFile() throws {
        // Given
        let modelData = ModelData()
        let expectedDishName =  Dish(name: "Garlic bread",
                                     description: "Du pain legèrement croustillant parfumé à l’ail",
                                     pictureName: "garlicBread",
                                     price: 3.5)
        
        // When
        let typeOfDishes: [TypeOfDish] = try modelData.load("Source.json")
        
        // Then
        XCTAssertNotNil(typeOfDishes, "Failed to load typeOfDishes from source.json")
        XCTAssertEqual(typeOfDishes.first?.dishs.first?.description, expectedDishName.description, "First dish description does not match expected value")
        XCTAssertEqual(typeOfDishes.first?.dishs.first?.description, expectedDishName.description, "First dish description does not match expected value")
        XCTAssertEqual(typeOfDishes.first?.dishs.first?.pictureName, expectedDishName.pictureName, "First dish pictureName does not match expected value")
        XCTAssertEqual(typeOfDishes.first?.dishs.first?.price, expectedDishName.price, "First dish price does not match expected value")
        
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }
}
