//
//  ContentView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Image(systemName: "safari.fill")
                        .renderingMode(.template)
                    Text("Explore")
                }
            MyRecipesView()
                .tabItem {
                    Image(systemName: "fork.knife")
                        .renderingMode(.template)
                    Text("My Recipes")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                        .renderingMode(.template)
                    Text("Profile")
                }
        }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
