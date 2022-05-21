//
//  MenuCard.swift
//  Floo
//
//  Created by MacBook Pro on 18/05/2022.
//

import SwiftUI

struct ExploreMenuCard: View {
    var recipe: RecipeDetail
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                image.resizable()
            } placeholder: {
//                ProgressView()
                Image("turtlerock")
            }
            .frame(width: 100, height: 100)
            .cornerRadius(20)
            .shadow(radius: 7)
                
            Text(recipe.title ?? "")
        }
    }
}

struct ExploreMenuCard_Previews: PreviewProvider {
    static var previews: some View {
        ExploreMenuCard(recipe: RecipeDetail())
    }
}
