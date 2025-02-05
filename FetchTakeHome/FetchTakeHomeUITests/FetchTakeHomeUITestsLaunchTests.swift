//
//  FetchTakeHomeUITestsLaunchTests.swift
//  FetchTakeHomeUITests
//
//  Created by camillo.de.martinis on 11/21/24.
//

import XCTest
import SwiftUI
@testable import FetchTakeHome

//final class FetchTakeHomeUITestsLaunchTests: XCTestCase {
//    func testRecipeViewDisplaysCorrectly() {
//        let recipe = Recipe(
//            uuid: "1",
//            name: "Spaghetti Bolognese",
//            cuisine: "Italian",
//            photoURLLarge: "https://example.com/large.jpg",
//            photoURLSmall: "https://example.com/small.jpg",
//            sourceURL: "https://example.com/recipe",
//            youtubeURL: "https://youtube.com/watch?v=xyz"
//        )
//        
//        let recipeView = RecipeView(recipe: recipe)
//        let controller = UIHostingController(rootView: recipeView)
//        
//        let view = controller.view
//        let app = XCUIApplication()
//        
//        // Here we should perform a snapshot test or a simple check that UI components render
//        XCTAssertNotNil(controller.view, "RecipeView should render correctly.")
//        
//        // Check if the name is displayed in the UI (via text search)
//        let nameLabel = app.staticTexts["Spaghetti Bolognese"]
//        XCTAssertTrue(nameLabel.exists, "The recipe name should be displayed.")
//        
//        // Check if the cuisine is displayed
//        let cuisineLabel = app.staticTexts["Italian"]
//        XCTAssertTrue(cuisineLabel.exists, "The recipe cuisine should be displayed.")
//    }
//}
