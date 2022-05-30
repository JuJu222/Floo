//
//  AddRecipeView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct AddRecipeView: View {
    @Environment(\.presentationMode) var presentation
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var calories: String = ""
    @State private var carbs: String = ""
    @State private var protein: String = ""
    @State private var calcium: String = ""
    @State var cuisines: [String] = [""]
    @State var ingredientsName: [String] = [""]
    @State var ingredientsAmount: [String] = [""]
    @State var ingredientsUnit: [String] = [""]
    @State var steps: [String] = [""]
    
//    init() {
//        UITableView.appearance().backgroundColor = .clear
//    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                }.foregroundColor(.black)
                
                Section(header: Text("Nutritions")) {
                    TextField("Calories", text: $calories)
                    TextField("Carbohydrates", text: $carbs)
                    TextField("Protein", text: $protein)
                    TextField("Calcium", text: $calcium)
                }.foregroundColor(.black)
                
                Section(header: Text("Cuisines")) {
                    ForEach(0..<cuisines.count, id: \.self) { index in
                        TextField("Cuisine \(index + 1)", text: self.$cuisines[index])
                    }

                    Button {
                        self.steps.append("")
                    } label: {
                        Text("Add More Cuisines")
                    }
                }.foregroundColor(.black)
                
                Section(header: Text("Ingredients")) {
                    ForEach(0..<ingredientsName.count, id: \.self) { index in
                        HStack {
                            TextField("Ingredient \(index + 1)", text: self.$ingredientsName[index])
                            Divider()
                            TextField("Amount", text: $ingredientsAmount[index])
                            Divider()
                            TextField("Unit", text: $ingredientsUnit[index])
                        }
                    }

                    Button {
                        self.ingredientsName.append("")
                        self.ingredientsAmount.append("")
                        self.ingredientsUnit.append("")
                    } label: {
                        Text("Add More Ingredients")
                    }
                }.foregroundColor(.black)
                
                Section(header: Text("Steps")) {
                    ForEach(0..<steps.count, id: \.self) { index in
                        TextField("Steps \(index + 1)", text: self.$steps[index])
                    }

                    Button {
                        self.steps.append("")
                    } label: {
                        Text("Add More Steps")
                    }
                }.foregroundColor(.black)
                
                Button {
                    var recipe = RecipeDetail()
                    recipe.nutrition = Nutrition()
                    recipe.nutrition?.nutrients = [Flavonoid](repeating: Flavonoid(), count: 22)
                    recipe.extendedIngredients = [ExtendedIngredient]()
                    recipe.analyzedInstructions = [AnalyzedInstruction](repeating: AnalyzedInstruction(), count: 1)
                    recipe.analyzedInstructions?[0].steps = [Step]()
                    recipe.cuisines = [String]()
                    recipe.title = name
                    recipe.summary = description
                    recipe.nutrition?.nutrients?[0].amount = Double(calories)
                    recipe.nutrition?.nutrients?[3].amount = Double(carbs)
                    recipe.nutrition?.nutrients?[8].amount = Double(protein)
                    recipe.nutrition?.nutrients?[21].amount = Double(calcium)
                    for cuisine in cuisines {
                        recipe.cuisines?.append(cuisine)
                    }
                    for (index, ingredient) in ingredientsName.enumerated() {
                        var temp = ExtendedIngredient()
                        temp.name = ingredient
                        temp.amount = Double(ingredientsAmount[index])
                        temp.unit = ingredientsUnit[index]
                        recipe.extendedIngredients?.append(temp)
                    }
                    for step in steps {
                        var temp = Step()
                        temp.step = step
                        recipe.analyzedInstructions?[0].steps?.append(temp)
                    }
                    submitForm(recipe: recipe)
//                    UserDefaults.standard.removeObject(forKey: "recipes")
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }
            }
            .navigationTitle("Add Recipe")
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
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        recipes.append(recipe)
        print(recipes)

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
