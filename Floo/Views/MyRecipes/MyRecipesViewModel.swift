import Foundation

class MyRecipesViewModel: ObservableObject {
    
    @Published var results = [RecipeDetail]()
    @Published var favRecipes = [RecipeDetail]()
    
    func loadData() {
        var recipes = [RecipeDetail]()
        
        if let data = UserDefaults.standard.data(forKey: "recipes") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                recipes = try decoder.decode([RecipeDetail].self, from: data)
                print(recipes)

                results = recipes
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
    }
    
    func loadFavRecipes() {
        var favRecipesId = [Int]()
        var queryIds = ""
        
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
        
        for (index, id) in favRecipesId.enumerated() {
            if (index == favRecipesId.count - 1) {
                queryIds = queryIds + String(id)
            } else {
                queryIds = queryIds + String(id) + ","
            }
        }
        
        
        guard let url = URL(string: "https://api.spoonacular.com/recipes/informationBulk?apiKey=\(ApiKey.apiKeys[1])&ids=\(queryIds)") else { fatalError("Missing URL") }

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
                            let result = try JSONDecoder().decode([RecipeDetail].self, from: data)
                            self.favRecipes = result
                        } catch let error {
                            print("Error decoding: ", error)
                        }
                    }
                }
            }

            dataTask.resume()
    }
}
