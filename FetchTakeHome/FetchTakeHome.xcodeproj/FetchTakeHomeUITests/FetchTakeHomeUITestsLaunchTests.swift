//
//  FetchTakeHomeUITestsLaunchTests.swift
//  FetchTakeHomeUITests
//
//  Created by camillo.de.martinis on 11/21/24.
//

@testable import FetchTakeHome

final class FetchTakeHomeUITestsLaunchTests: XCTestCase {
    var recipeFetcher = RecipeViewModel()

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()  // This launches the app automatically
    }
    
    override func tearDownWithError() throws {
        app = nil
    }

    func testLaunch() {
        // Check if the launch screen appears correctly
        let launchScreen = app.images["LaunchImage"]
        XCTAssertTrue(launchScreen.exists, "Launch screen should appear.")
    }

    func testRecipeNavigation() {
        // Assuming your app's main screen lists recipes
        let recipeName = app.staticTexts["Spaghetti Bolognese"]
        
        XCTAssertTrue(recipeName.exists, "Recipe name should exist.")
        
        recipeName.tap()  // Tap the recipe to navigate to its details
        
        // Check if the detail page contains the name and cuisine
        let recipeDetailName = app.staticTexts["Spaghetti Bolognese"]
        let recipeDetailCuisine = app.staticTexts["Italian"]
        
        XCTAssertTrue(recipeDetailName.exists, "Recipe name should be displayed in the details.")
        XCTAssertTrue(recipeDetailCuisine.exists, "Recipe cuisine should be displayed in the details.")
    }

    func testLinkNavigation() {
        // Test that tapping the "View Recipe Here" link opens the URL
        let link = app.links["View Recipe Here"]
        XCTAssertTrue(link.exists, "The recipe link should exist.")
        
        link.tap()
        
        // You can check if the Safari app (or browser) opens or if there's a valid URL action
        // This test can be tricky depending on how the link is handled in the app.
    }
}
