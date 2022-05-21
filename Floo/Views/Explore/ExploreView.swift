//
//  ExploreView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ExploreViewModel()
    private var columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.results, id: \.self) { recipe in
                        NavigationLink {
                            RecipeDetailView(id: recipe.id ?? -1)
                        } label: {
                            ExploreMenuCard(recipe: recipe)
                        }
                    }
                }
            }
            .navigationTitle("Explore Recipes")
            .onAppear{
                viewModel.loadData()
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
