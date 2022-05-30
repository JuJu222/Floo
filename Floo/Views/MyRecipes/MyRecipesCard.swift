//
//  MyRecipesCard.swift
//  Floo
//
//  Created by MacBook Pro on 19/05/2022.
//

import SwiftUI

struct MyRecipesCard: View {
    var recipe: RecipeDetail
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
//                Image("turtlerock")
//                    .resizable()
//                    .scaledToFill()
            }
            .overlay {
                TextOverlay(recipe: recipe)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
            .cornerRadius(20)
            .shadow(radius: 7)
                
            Text(recipe.title ?? "")
        }
    }
}

struct MyRecipesCardSavedRecipes: View {
    var recipe: RecipeDetail
    
    var body: some View {
        VStack {
            Image("Rectangle 8")
                .resizable()
                .scaledToFill()
                .overlay {
                    TextOverlay(recipe: recipe)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                .cornerRadius(20)
                .shadow(radius: 7)
                
            Text(recipe.title ?? "")
        }
    }
}

struct TextOverlay: View {
    var recipe: RecipeDetail
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack {
            gradient
            Text(recipe.title ?? "Title")
                .font(.title)
                .bold()
        }
        .foregroundColor(.white)
    }
}

struct MyRecipesCard_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipesCard(recipe: RecipeDetail())
    }
}
