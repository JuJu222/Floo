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
    
    //    init() {
    //        UITableView.appearance().backgroundColor = .clear
    //    }
    
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
        var user = User()
        
        if let data = UserDefaults.standard.data(forKey: "user") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
                
                // Decode Note
                user = try decoder.decode(User.self, from: data)
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        user = editedUser
        
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()
            
            // Encode Note
            let data = try encoder.encode(user)
            
            // Write/Set Data
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
