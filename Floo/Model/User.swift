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
    
    static let `default` = User()
}
