//
//  Recipe.swift
//  FetchTakeHome
//
//  Created by camillo.de.martinis on 11/21/24.
//

import SwiftUI
import Foundation

struct Recipe: Identifiable, Decodable {
    var id: String { uuid }
      let uuid: String
      let name: String
      let cuisine: String
      let photoURLLarge: String?
      let photoURLSmall: String?
      let sourceURL: String?
      let youtubeURL: String?

    
    enum CodingKeys: String, CodingKey {
        case uuid
        case name
        case cuisine
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
}

struct RecipeResponse: Decodable {
    let recipes: [Recipe]
}
