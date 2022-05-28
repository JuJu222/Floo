//
//  RecipeDetailView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    @StateObject var viewModel = RecipeDetailViewModel()
    var id: Int
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: viewModel.results.image ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(3 / 2, contentMode: .fit)
                        .ignoresSafeArea()
                } placeholder: {
    //                ProgressView()
                    Image("turtlerock")
                        .resizable()
                        .aspectRatio(3 / 2, contentMode: .fit)
                        .ignoresSafeArea()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.results.title ?? "Title")
                        .font(.title2)
                        .bold()
                    
                    Text(viewModel.results.summary ?? "Description")
                        .font(.subheadline)

                    Text("Nutritions")
                        .font(.title2)
                        .bold()
                    
                    VStack {
                        HStack {
                            HStack {
                                Text(String(format: "%.0f", viewModel.results.nutrition?.nutrients?[0].amount ?? 0.0))
                                    .font(.title2)
                                    .bold()
                                
                                VStack {
                                    Text("Calories")
                                    Text("kcal")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "E88787"))
                            .cornerRadius(16)
                            
                            HStack {
                                Text(String(viewModel.results.nutrition?.nutrients?[3].amount ?? 0.0))
                                    .font(.title2)
                                    .bold()
                                
                                VStack {
                                    Text("Carbo")
                                    Text("gram")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.secondary)
                            .cornerRadius(16)
                        }
                    }
                    
                    VStack {
                        HStack {
                            HStack {
                                Text(String(viewModel.results.nutrition?.nutrients?[8].amount ?? 0.0))
                                    .font(.title2)
                                    .bold()
                                
                                VStack {
                                    Text("Protein")
                                    Text("gram")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.secondary)
                            .cornerRadius(16)
                            
                            HStack {
                                Text(String(viewModel.results.nutrition?.nutrients?[21].amount ?? 0.0))
                                    .font(.title2)
                                    .bold()
                                
                                VStack {
                                    Text("Calcium")
                                    Text("mg")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.secondary)
                            .cornerRadius(16)
                        }
                    }
                    
                    Text("Ingredients")
                        .font(.title2)
                        .bold()
                    
                    VStack(alignment: .leading) {
                        ForEach(viewModel.results.extendedIngredients ?? [ExtendedIngredient](), id: \.self) { ingredient in
                            Text(ingredient.name ?? "Ingredient")
                                .padding()
                        }
                    }
                    
                    Text("Steps")
                        .font(.title2)
                        .bold()
                    
                    VStack(alignment: .leading) {
                        ForEach(viewModel.results.analyzedInstructions?[0].steps ?? [Step](), id: \.self) { step in
                            Text(step.step ?? "Step")
                                .padding()
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
            .onAppear {
                viewModel.loadData(id: self.id)
                print(self.id)
            }
        }
    }
}

struct RecipeDetailViewMyRecipe: View {
    var recipe: RecipeDetail
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("turtlerock")
                    .resizable()
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(recipe.title ?? "Title")
                        .font(.title2)
                        .bold()
                    
                    Text(recipe.summary ?? "Description")
                        .font(.subheadline)

                    Text("Nutritions")
                        .font(.title2)
                        .bold()
                    
                    VStack {
                        HStack {
                            HStack {
                                Text(String(format: "%.0f", recipe.nutrition?.nutrients?[0].amount ?? 0.0))
                                    .font(.title2)
                                    .bold()
                                
                                VStack {
                                    Text("Calories")
                                    Text("kcal")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "E88787"))
                            .cornerRadius(16)
                            
                            HStack {
                                Text(String(recipe.nutrition?.nutrients?[3].amount ?? 0.0))
                                    .font(.title2)
                                    .bold()
                                
                                VStack {
                                    Text("Carbo")
                                    Text("gram")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.secondary)
                            .cornerRadius(16)
                        }
                    }
                    
                    VStack {
                        HStack {
                            HStack {
                                Text(String(recipe.nutrition?.nutrients?[8].amount ?? 0.0))
                                    .font(.title2)
                                    .bold()
                                
                                VStack {
                                    Text("Protein")
                                    Text("gram")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.secondary)
                            .cornerRadius(16)
                            
                            HStack {
                                Text(String(recipe.nutrition?.nutrients?[21].amount ?? 0.0))
                                    .font(.title2)
                                    .bold()
                                
                                VStack {
                                    Text("Calcium")
                                    Text("mg")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.secondary)
                            .cornerRadius(16)
                        }
                    }
                    
                    Text("Ingredients")
                        .font(.title2)
                        .bold()
                    
                    VStack(alignment: .leading) {
                        ForEach(recipe.extendedIngredients ?? [ExtendedIngredient](), id: \.self) { ingredient in
                            Text(ingredient.name ?? "Ingredient")
                                .padding()
                        }
                    }
                    
                    Text("Steps")
                        .font(.title2)
                        .bold()
                    
                    VStack(alignment: .leading) {
                        ForEach(recipe.analyzedInstructions?[0].steps ?? [Step](), id: \.self) { step in
                            Text(step.step ?? "Step")
                                .padding()
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(id: 1)
    }
}
