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
    @State var user = User()
    private var columns = [GridItem(.flexible(), alignment: .topLeading), GridItem(.flexible(), alignment: .topLeading)]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Rectangle 8")
                    .resizable()
                //                .aspectRatio(contentMode: .fill)
                
                VStack {
                    ProfileOverlay(user: user)
                    
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
                                        
                                        Text(user.about)
                                        
                                        Text("Speciality ")
                                            .font(.title2)
                                            .bold()
                                        
                                        VStack(alignment: .leading, spacing: 6) {
                                            ForEach(user.specialities, id: \.self) { speciality in
                                                Text("- " + speciality)
                                            }
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
                    getUser()
                }
            }.navigationBarHidden(true)
        }
    }
    
    func getUser() {
        var user = User()
        if let data = UserDefaults.standard.data(forKey: "user") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
                
                // Decode Note
                user = try decoder.decode(User.self, from: data)
                
                self.user.name = user.name
                self.user.title = user.title
                self.user.about = user.about
                self.user.specialities = user.specialities
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
    }
}

struct ProfileOverlay: View {
    @State var user: User
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
                
                Text(user.name)
                    .font(.title)
                    .bold()
                
                Text(user.title)
                
                NavigationLink {
                    EditProfileView(user: $user)
                } label: {
                    HStack {
                        Spacer()
                        Text("Edit Profile")
                        Spacer()
                    }
                }
                .buttonStyle(.bordered)
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
