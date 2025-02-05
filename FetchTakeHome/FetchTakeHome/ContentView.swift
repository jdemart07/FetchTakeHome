//
//  ContentView.swift
//  FetchTakeHome
//
//  Created by camillo.de.martinis on 11/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = RecipeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    print("Recipes received!")
                    Task {
                        await viewModel.getRecipes()
                    }
                }) {
                    Image(systemName: "arrow.clockwise")                              .font(.largeTitle)
                        .foregroundColor(.orange)
                }
                Spacer()
                
                if viewModel.recipesAreLoading {
                    ProgressView()
                        .progressViewStyle(.linear)
                        .padding()
            //malformed data view
                } else if viewModel.error != nil{
                    Text("Could not load recipes, try again!")
                        .padding()
            //recipe list is empty view
                } else if viewModel.isEmpty {
                    Text("No recipes available.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(viewModel.recipes) { recipe in
                        RecipeView(recipe: recipe)
                    }
                    .navigationTitle("Fetch Recipes!")
                }
            }
            .onAppear {
                Task {
                    await viewModel.getRecipes()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
