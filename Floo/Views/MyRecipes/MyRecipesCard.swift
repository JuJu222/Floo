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
            } placeholder: {
//                ProgressView()
                Image("turtlerock")
            }
            .frame(width: 120, height: 180)
            .overlay {
                TextOverlay(recipe: recipe)
            }
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
            VStack {
                Text(recipe.title ?? "")
                    .font(.title)
                    .bold()
                
                Text("aaa")
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct MyRecipesCard_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipesCard(recipe: RecipeDetail())
    }
}
