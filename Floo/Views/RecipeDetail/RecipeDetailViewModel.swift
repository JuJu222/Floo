//
//  RecipeDetailViewModel.swift
//  Floo
//
//  Created by MacBook Pro on 15/05/2022.
//

import Foundation

class RecipeDetailViewModel: ObservableObject {
    @Published var loading = true
    @Published var results: RecipeDetail = RecipeDetail()
    
    func loadData(id: Int) {
        self.loading = true
        guard let url = URL(string: "https://api.spoonacular.com/recipes/\(id)/information?apiKey=\(ApiKey.apiKeys[1])&includeNutrition=true") else { fatalError("Missing URL") }

            let urlRequest = URLRequest(url: url)

            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    print("Request error: ", error)
                    return
                }

                guard let response = response as? HTTPURLResponse else { return }

                if response.statusCode == 200 {
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        do {
                            let result = try JSONDecoder().decode(RecipeDetail.self, from: data)
                            self.results = result
                            self.results.summary = self.results.summary!.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                            print(self.results)
                            self.loading = false
                        } catch let error {
                            print("Error decoding: ", error)
                        }
                    }
                }
            }

            dataTask.resume()
    }
    
    func setFavorite(id: Int) {
        var favRecipesId = [Int]()
        
        if let data = UserDefaults.standard.data(forKey: "favRecipesId") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                favRecipesId = try decoder.decode([Int].self, from: data)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        favRecipesId.append(id)
        
        print(favRecipesId)

        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(favRecipesId)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "favRecipesId")

        } catch {
            print("Unable to Encode Array of Recipes (\(error))")
        }
    }
    
    func removeFavorite(id: Int) {
        var favRecipesId = [Int]()
        
        if let data = UserDefaults.standard.data(forKey: "favRecipesId") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                favRecipesId = try decoder.decode([Int].self, from: data)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        for (index, recipeId) in favRecipesId.enumerated() {
            if (recipeId == id) {
                favRecipesId.remove(at: index)
            }
        }
        
        print(favRecipesId)

        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(favRecipesId)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "favRecipesId")

        } catch {
            print("Unable to Encode Array of Recipes (\(error))")
        }
    }
}
