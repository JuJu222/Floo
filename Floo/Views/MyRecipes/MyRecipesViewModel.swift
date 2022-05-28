import Foundation

class MyRecipesViewModel: ObservableObject {
    
    @Published var results = [RecipeDetail]()
    
    func loadData() {
        var recipes = [RecipeDetail]()
        
        if let data = UserDefaults.standard.data(forKey: "recipes") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                recipes = try decoder.decode([RecipeDetail].self, from: data)

                results = recipes
                print(results)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
    }
}
