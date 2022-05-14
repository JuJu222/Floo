//
//  ExploreView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.results, id: \.id) { recipe in
                NavigationLink {
                    RecipeDetailView()
                } label: {
                    Text(recipe.title)
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
