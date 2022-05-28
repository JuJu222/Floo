//
//  MyRecipesView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct MyRecipesView: View {
    @StateObject var viewModel = MyRecipesViewModel()
    private var columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading) {
                        Text("Nutritions")
                            .font(.title2)
                            .bold()
                        
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.results, id: \.self) { recipe in
                                NavigationLink {
                                    RecipeDetailViewMyRecipe(recipe: recipe)
                                } label: {
                                    MyRecipesCard(recipe: recipe)
                                }
                            }
                        }
                    }
                    
                    Text("Ingredients")
                        .font(.title2)
                        .bold()
                    
                    
                    NavigationLink {
                        AddRecipeView()
                    } label: {
                        Text("Add Recipe")
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
                .navigationTitle("My Recipes")
                .onAppear {
                    viewModel.loadData()
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
