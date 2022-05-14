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
                    Image(systemName: "phone.fill")
                    Text("Explore")
                    
                }
            MyRecipesView()
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("My Recipes")
                    
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("Profile")
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
