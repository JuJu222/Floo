// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recipeAll = try? newJSONDecoder().decode(RecipeAll.self, from: jsonData)

import Foundation

// MARK: - RecipeAll
struct RecipeAll: Codable {
    let recipes: [RecipeDetail]
}
