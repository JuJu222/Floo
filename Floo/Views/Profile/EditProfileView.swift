//
//  AddRecipeView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct EditProfileView: View {
    @Binding var user: User
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        Form {
            Section(header: Text("General")) {
                TextField("Name", text: $user.name)
                TextField("Title", text: $user.title)
            }.foregroundColor(.black)
            
            Section(header: Text("About You")) {
                TextEditor(text: $user.about)
            }.foregroundColor(.black)
            
            Section(header: Text("Speciality")) {
                ForEach(0..<$user.specialities.count, id: \.self) { index in
                    TextField("Speciality \(index + 1)", text: $user.specialities[index])
                }
                
                Button {
                    user.specialities.append("")
                } label: {
                    Text("Add More speciality")
                }
            }.foregroundColor(.black)
            
            Button {
                submitForm(editedUser: self.user)
                self.presentation.wrappedValue.dismiss()
            } label: {
                HStack {
                    Spacer()
                    Text("Submit")
                    Spacer()
                }
            }
        }
        .navigationTitle("Edit Profile")
    }
    
    func submitForm(editedUser: User) {
        var user = User(name: "Justin Jap", title: "Home Chef", about: "After attending computer science school, I am interested in cooking food especially Indian food. Prata bread and butter chicken are my favourite foods.", specialities: ["Butter Chicken", "Prata Bread", "Fish Curry", "Kofta"])
        
        if let data = UserDefaults.standard.data(forKey: "user") {
            do {
                let decoder = JSONDecoder()
                
                user = try decoder.decode(User.self, from: data)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        user = editedUser
        
        do {
            let encoder = JSONEncoder()
            
            let data = try encoder.encode(user)
            
            UserDefaults.standard.set(data, forKey: "user")
        } catch {
            print("Unable to Encode Array of Recipes (\(error))")
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: .constant(.default))
    }
}
