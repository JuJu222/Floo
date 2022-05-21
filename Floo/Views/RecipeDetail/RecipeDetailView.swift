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
        VStack(alignment: .leading) {
            Image("turtlerock")
                .resizable()
                .aspectRatio(3 / 2, contentMode: .fit)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.results.title ?? "Hi")
                    .font(.system(size: 19))
                
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("Nutritions")
                    .font(.title2)
                
                VStack {
                    HStack {
                        HStack {
                            Text("200")
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
                
                VStack(alignment: .leading) {
                    Text("A List Item")
                    Text("A Second List Item")
                    Text("A Third List Item")
                }
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            viewModel.loadData(id: self.id)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(id: 1)
    }
}
