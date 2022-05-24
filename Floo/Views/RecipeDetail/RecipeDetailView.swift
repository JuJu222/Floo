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
                                Text("200")
                                    .font(.title2)
                                    .bold()
                                
                                VStack {
                                    Text("Calories")
                                    Text("Gram")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.secondary)
                            .cornerRadius(16)
                            
                            HStack {
                                Text("200")
                                    .font(.title2)
                                    .bold()
                                
                                VStack {
                                    Text("Carbo")
                                    Text("Gram")
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
                                Text("200")
                                    .font(.title2)
                                    .bold()
                                
                                VStack {
                                    Text("Calories")
                                    Text("Gram")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.secondary)
                            .cornerRadius(16)
                            
                            HStack {
                                Text("200")
                                    .font(.title2)
                                    .bold()
                                
                                VStack {
                                    Text("Carbo")
                                    Text("Gram")
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

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(id: 1)
    }
}
