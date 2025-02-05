//
//  RecipeView.swift
//  FetchTakeHome
//
//  Created by camillo.de.martinis on 11/21/24.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        VStack() {
            HStack{
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 8)
                    
                    Text(recipe.cuisine)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            AsyncImage(url: URL(string: recipe.photoURLSmall ?? "nil")) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .cornerRadius(20)
            } placeholder: {
                Color.gray
                    .frame(height: 200)
                    .cornerRadius(10)
            }
            HStack() {
              
                Spacer()
                VStack(alignment: .trailing) {
                    if let sourceURLString = recipe.sourceURL, !sourceURLString.isEmpty, let sourceURL = URL(string: sourceURLString) {
                        Link("View Recipe Here", destination: sourceURL)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    if let youtubeURLString = recipe.youtubeURL, !youtubeURLString.isEmpty, let youtubeURL = URL(string: youtubeURLString) {
                        Link("Watch Video", destination: youtubeURL)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }
            }
        }
        .padding()
    }
}
#Preview {
    RecipeView(recipe: Recipe(uuid:  "74f6d4eb-da50-4901-94d1-deae2d8af1d1",
                              name: "Apam Balik",
                              cuisine: "British",
                              photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
                              photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
                              sourceURL: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
                              youtubeURL: "https://www.youtube.com/watch?v=4vhcOwVBDO4"))
}
