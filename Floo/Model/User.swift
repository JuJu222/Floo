//
//  User.swift
//  Floo
//
//  Created by MacBook Pro on 19/05/2022.
//

import Foundation

struct User: Codable {
    var name: String = ""
    var title: String = ""
    var about: String = ""
    var specialities: [String] = []
    
    static let `default` = User(name: "Justin Jap", title: "Home Chef", about: "After attending computer science school, I am interested in cooking food especially Indian food. Prata bread and butter chicken are my favourite foods.", specialities: ["Butter Chicken", "Prata Bread", "Fish Curry", "Kofta"])
    
    init(name: String, title: String, about: String, specialities: [String]) {
        self.name = name
        self.title = title
        self.about = about
        self.specialities = specialities
    }
}
