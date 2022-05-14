//
//  ExploreViewModel.swift
//  Floo
//
//  Created by MacBook Pro on 14/05/2022.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var results: [Recipe] = []
    
    func loadData() {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/random?apiKey=958bd58dc3c24ef297f7e473436430c0") else { fatalError("Missing URL") }

            let urlRequest = URLRequest(url: url)

            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    print("Request error: ", error)
                    return
                }

                guard let response = response as? HTTPURLResponse else { return }

                if response.statusCode == 200 {
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        do {
                            let decodedUsers = try JSONDecoder().decode(RecipeAll.self, from: data)
                            self.results = decodedUsers.recipes
                        } catch let error {
                            print("Error decoding: ", error)
                        }
                    }
                }
            }

            dataTask.resume()
    }
}
