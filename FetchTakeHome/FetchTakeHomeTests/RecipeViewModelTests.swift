//
//  RecipeViewModelTests.swift
//  FetchTakeHomeTests
//
//  Created by camillo.de.martinis on 2/4/25.
//

import XCTest
@testable import FetchTakeHome

final class RecipeViewModelTests: XCTestCase {
    var viewModel: RecipeViewModel!
    
    override func setUpWithError() throws {
          // Register the MockURLProtocol to intercept network requests
          URLProtocol.registerClass(MockURL.self)
        
          // Set the request handler to simulate an empty response
          MockURL.requestHandler = { request in
              // Simulate an empty response (no data)
              return (Data(), HTTPURLResponse(), nil) // Empty data
          }

          // Initialize your view model (which will use URLSession.shared)
          viewModel = RecipeViewModel()
      }

    override func tearDownWithError() throws {
        viewModel = nil
        super.tearDown()
    }

    func testGetRecipes() async throws {
        let mockJSON = """
                {
                    "recipes": [
                        {
                            "uuid": "123",
                            "name": "Spaghetti Bolognese",
                            "cuisine": "Italian",
                            "photo_url_large": "https://example.com/photo_large.jpg",
                            "photo_url_small": "https://example.com/photo_small.jpg",
                            "source_url": "https://example.com/recipe",
                            "youtube_url": "https://youtube.com/watch?v=example"
                        }
                    ]
                }
                """.data(using: .utf8)!
        
        MockURL.requestHandler = { request in
            // Return the mock data for any request
            return (mockJSON, HTTPURLResponse(), nil)
        }
        await viewModel.getRecipes()
        
        XCTAssertFalse(viewModel.recipes.isEmpty, "Recipes should be loaded.")
        XCTAssertNil(viewModel.error, "There should be no errors when loading recipes.")
    }
    
    func testGetRecipesWithError() async throws {
           // Simulate an error (e.g., an invalid URL error)
           let expectedError = NSError(domain: "Test", code: 999, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
           MockURL.simulatedError = expectedError

           // Call the method that fetches recipes (which will now simulate an error)
           await viewModel.getRecipes()

           // Verify that the error is handled correctly
           XCTAssertNotNil(viewModel.error, "There should be an error when the network request fails.")
           XCTAssertEqual(viewModel.error, expectedError.localizedDescription, "The error description should match the simulated error.")
       }
    
    // Test when the response is empty
    func testGetEmptyRecipes() async throws {
        await viewModel.getRecipes()
        
        XCTAssertTrue(viewModel.isEmpty, "ViewModel should handle empty recipes gracefully.")
        XCTAssertTrue(viewModel.recipes.isEmpty, "Recipes should be empty.")
    }

}
