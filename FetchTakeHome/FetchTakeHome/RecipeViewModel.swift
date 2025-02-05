//
//  RecipeViewModel.swift
//  FetchTakeHome
//
//  Created by camillo.de.martinis on 11/21/24.
//

import Foundation
import SwiftUI
import Combine

class RecipeViewModel: ObservableObject {
    @Published var error: String?
    @Published var recipes: [Recipe] = []
    @Published var recipesAreLoading = false
    @Published var isEmpty: Bool = false


    // Allow the URLSession to be injected for testability
    var url: URL
    var urlSession: URLSession

    init(url: URL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!,
         urlSession: URLSession = URLSession.shared) {
        self.url = url
        self.urlSession = urlSession
    }

    
    @MainActor
    func getRecipes() async{
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if data.isEmpty {
                self.isEmpty = true
                self.recipesAreLoading = false
                return
            }
            let decodedResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
                
            if decodedResponse.recipes.isEmpty {
                self.isEmpty = true
            } else {
                self.recipes = decodedResponse.recipes
            }
            self.recipesAreLoading = false
            
        } catch {
            print("Error: \(error)")
                self.error = error.localizedDescription
                self.recipesAreLoading = false
            }
        }
}
