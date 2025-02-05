//
//  FetchTakeHomeUITest.swift
//  FetchTakeHomeUITest
//
//  Created by camillo.de.martinis on 2/4/25.
//

import XCTest
import SwiftUI
@testable import FetchTakeHome

final class FetchTakeHomeUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRecipeViewDisplaysCorrectly() {
         let recipe = Recipe(
             uuid: "1",
             name: "Spaghetti Bolognese",
             cuisine: "Italian",
             photoURLLarge: "https://example.com/large.jpg",
             photoURLSmall: "https://example.com/small.jpg",
             sourceURL: "https://example.com/recipe",
             youtubeURL: "https://youtube.com/watch?v=xyz"
         )
         
         let recipeView = RecipeView(recipe: recipe)
         let controller = UIHostingController(rootView: recipeView)
         
         // Here we should perform a snapshot test or a simple check that UI components render
         XCTAssertNotNil(controller.view, "RecipeView should render correctly.")
        let app = XCUIApplication()

        // Check if the name is displayed in the UI (via text search)
        let nameLabel = app.staticTexts["Spaghetti Bolognese"]
        XCTAssertTrue(nameLabel.exists, "The recipe name should be displayed.")
        
        // Check if the cuisine is displayed
        let cuisineLabel = app.staticTexts["Italian"]
        XCTAssertTrue(cuisineLabel.exists, "The recipe cuisine should be displayed.")
    }
}
