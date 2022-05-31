// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recipeDetail = try? newJSONDecoder().decode(RecipeDetail.self, from: jsonData)

import Foundation

// MARK: - RecipeDetail
struct RecipeSearch: Codable {
    var results: [Result]?
    var offset, number, totalResults: Int?
}

// MARK: - Result
struct Result: Codable, Hashable {
    static func == (lhs: Result, rhs: Result) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: Int?
    var title: String?
    var image: String?
    var imageType: ImageType?
}

enum ImageType: String, Codable {
    case jpg = "jpg"
}
