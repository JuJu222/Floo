//
//  ProfileView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = MyRecipesViewModel()
    @State var selected = 0
    private var columns = [GridItem(.flexible(), alignment: .topLeading), GridItem(.flexible(), alignment: .topLeading)]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Rectangle 8")
                    .resizable()
                //                .aspectRatio(contentMode: .fill)
                
                VStack {
                    ProfileOverlay()
                    
                    ZStack {
                        Color(.white)
                            .shadow(color: .black, radius: 20, x: 0, y: -20)
                            .cornerRadius(10, corners: [.topLeft, .topRight])
                        
                        VStack {
                            Picker(selection: $selected, label: Text(""), content: {
                                Text("Chef Info").tag(0)
                                Text("\(viewModel.results.count) Recipes").tag(1)
                            }).pickerStyle(SegmentedPickerStyle())
                            
                            Divider()
                            
                            ScrollView {
                                VStack(alignment: .leading, spacing: 10) {
                                    if (selected == 0) {
                                        Text("About ")
                                            .font(.title2)
                                            .bold()
                                        
                                        Text("After attending computer science school, I am interested in cooking food especially Indian food. Prata bread and butter chicken are my favourite foods.")
                                        
                                        Text("Speciality ")
                                            .font(.title2)
                                            .bold()
                                        
                                        VStack(alignment: .leading, spacing: 6) {
                                            Text("- Butter Chicken")
                                            Text("- Prata Bread")
                                            Text("- Fish Curry")
                                            Text("- Kofta")
                                        }
                                    } else {
                                        LazyVGrid(columns: columns) {
                                            ForEach(viewModel.results, id: \.title) { recipe in
                                                NavigationLink {
                                                    RecipeDetailViewMyRecipe(recipe: recipe)
                                                } label: {
                                                    MyRecipesCardSavedRecipes(recipe: recipe)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }.padding()
                    }
                }.onAppear {
                    viewModel.loadData()
                }
            }.navigationBarHidden(true)
        }
    }
}

struct ProfileOverlay: View {
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
                Image("Ellipse 3")
                    .clipShape(Circle())
                    .shadow(radius: 7)
                
                Text("Kenny Jinhiro")
                    .font(.title)
                    .bold()
                
                Text("Home Chef")
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
