//
//  MyRecipesView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct MyRecipesView: View {
    @StateObject var viewModel = MyRecipesViewModel()
    private var columns = [GridItem(.flexible(), alignment: .topLeading), GridItem(.flexible(), alignment: .topLeading)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading) {
                        Text("Favorites")
                            .font(.title2)
                            .bold()
                        
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.favRecipes, id: \.self) { recipe in
                                NavigationLink {
                                    RecipeDetailView(id: recipe.id!)
                                } label: {
                                    MyRecipesCard(recipe: recipe)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Saved Recipes")
                            .font(.title2)
                            .bold()
                        
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.results, id: \.title) { recipe in
                                NavigationLink {
                                    RecipeDetailViewMyRecipe(recipe: recipe)
                                } label: {
                                    MyRecipesCardSavedRecipes(recipe: recipe)
                                }
                            }
                        }
                    }
                    
                    NavigationLink {
                        AddRecipeView()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Add Recipe")
                            Spacer()
                        }
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                  )
                .padding()
                .navigationTitle("My Recipes")
                .onAppear {
                    viewModel.loadData()
                    viewModel.loadFavRecipes()
                }
            }
        }
    }
}

struct MyRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipesView()
    }
}
