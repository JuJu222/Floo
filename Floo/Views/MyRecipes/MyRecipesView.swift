//
//  MyRecipesView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct MyRecipesView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Nutritions")
                    .font(.title2)
                
                Text("Ingredients")
                    .font(.title2)
                
                VStack(alignment: .leading) {
                    Text("A List Item")
                    Text("A Second List Item")
                    Text("A Third List Item")
                }
                
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
        }
    }
}

struct MyRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        MyRecipesView()
    }
}
