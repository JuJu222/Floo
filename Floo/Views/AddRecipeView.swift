//
//  AddRecipeView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var givenName: String = ""
    @State private var familyName: String = ""
    
    init() {
            UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("PROFILE")) {
                    HStack {
                        Text("Username").bold()
                        Divider()
                        TextField("Username", text: $givenName)
                    }
                    
                    HStack {
                        Text("Username").bold()
                        Divider()
                        TextField("Username", text: $givenName)
                    }
                }
                
                Button {
                    var recipe = RecipeDetail()
                    recipe.title = givenName
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
        
        UserDefaults.standard.removeObject(forKey: "recipes")
        
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
