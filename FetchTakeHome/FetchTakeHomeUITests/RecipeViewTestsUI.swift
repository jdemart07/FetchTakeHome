//
//  RecipeViewTestsUI.swift
//  FetchTakeHomeUITests
//
//  Created by camillo.de.martinis on 2/4/25.
//

import XCTest
import SwiftUI
@testable import FetchTakeHome

final class RecipeViewTestsUI: XCTestCase {

        override class var runsForEachTargetApplicationUIConfiguration: Bool {
            return true
        }

        // Setup method to configure the app
        override func setUpWithError() throws {
            continueAfterFailure = false
        }

        // Test if the SwiftUI view displays correctly in the app
        func testRecipeViewDisplaysCorrectly() {
            // Create a test recipe
            let recipe = Recipe(
                uuid: "1",
                name: "Spaghetti Bolognese",
                cuisine: "Italian",
                photoURLLarge: "https://example.com/large.jpg",
                photoURLSmall: "https://example.com/small.jpg",
                sourceURL: "https://example.com/recipe",
                youtubeURL: "https://youtube.com/watch?v=xyz"
            )
            
            // Instantiate the view within a UIHostingController
            let recipeView = RecipeView(recipe: recipe)
            let controller = UIHostingController(rootView: recipeView)
            
            // Get the app for UI testing
            let app = XCUIApplication()
            
            // Launch the app
            app.launch()
            
            // Here we should ensure that the view renders properly
            XCTAssertNotNil(controller.view, "RecipeView should render correctly.")
            
            // Check if the name is displayed in the UI (via text search)
            let nameLabel = app.staticTexts["Spaghetti Bolognese"]
            XCTAssertTrue(nameLabel.exists, "The recipe name should be displayed.")
            
            // Check if the cuisine is displayed
            let cuisineLabel = app.staticTexts["Italian"]
            XCTAssertTrue(cuisineLabel.exists, "The recipe cuisine should be displayed.")
        }
}
