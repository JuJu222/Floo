//
//  AddRecipeView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var name: String = ""
    @State private var description: String = ""
    
    init() {
            UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                }
                
                Section(header: Text("Nutritions")) {
                    TextField("Calories", text: $name)
                    TextField("Description", text: $description)
                }
                
                Button {
                    var recipe = RecipeDetail()
                    recipe.title = name
                    submitForm(recipe: recipe)
                } label: {
                    Text("Submit")
                }
                .buttonStyle(.bordered)
            }
            .navigationTitle("Navigation")
        }
    }
    
    func submitForm(recipe: RecipeDetail) {
        var recipes = [RecipeDetail]()
        
        if let data = UserDefaults.standard.data(forKey: "recipes") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                recipes = try decoder.decode([RecipeDetail].self, from: data)

                print(recipes)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        recipes.append(recipe)

        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(recipes)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "recipes")

        } catch {
            print("Unable to Encode Array of Recipes (\(error))")
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
