//
//  MenuCard.swift
//  Floo
//
//  Created by MacBook Pro on 18/05/2022.
//

import SwiftUI

struct ExploreMenuCard: View {
    var recipe: Result
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
//                Image("turtlerock")
//                    .resizable()
//                    .scaledToFill()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
            .cornerRadius(20)
            .shadow(radius: 7)
                
            Text(recipe.title ?? "")
                .font(.system(size: 14))
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct ExploreMenuCard_Previews: PreviewProvider {
    static var previews: some View {
        ExploreMenuCard(recipe: Result())
    }
}
