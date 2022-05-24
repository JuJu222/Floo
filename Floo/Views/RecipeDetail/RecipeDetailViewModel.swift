//
//  RecipeDetailViewModel.swift
//  Floo
//
//  Created by MacBook Pro on 15/05/2022.
//

import Foundation

class RecipeDetailViewModel: ObservableObject {
    
    @Published var results: RecipeDetail = RecipeDetail()
    
    func loadData(id: Int) {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/\(id)/information?apiKey=\(ApiKey.apiKeys[1])") else { fatalError("Missing URL") }

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
                            let decodedUsers = try JSONDecoder().decode(RecipeDetail.self, from: data)
                            self.results = decodedUsers
                            self.results.summary = self.results.summary!.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                        } catch let error {
                            print("Error decoding: ", error)
                        }
                    }
                }
            }

            dataTask.resume()
    }
}
