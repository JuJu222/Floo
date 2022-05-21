//
//  AddRecipeView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var givenName: String = ""
    @State private var familyName: String = ""
    
    init() {
            UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Text("Username").bold()
                    Divider()
                    TextField("Username", text: $givenName)
                }
                HStack {
                    Text("Username").bold()
                    Divider()
                    TextField("Username", text: $givenName)
                }
                .background(.white)
            }
            .navigationTitle("Navigation")
        }
        
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
