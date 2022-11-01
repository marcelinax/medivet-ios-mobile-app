//
//  HomeScreenController.swift
//  Medivet
//
//  Created by Marcelina Sitko on 31/10/2022.
//

import UIKit

class HomeScreenController: UIViewController, ObservableObject {
    @Published var errors: [String] = [""]
    private var authTokenStore = AuthTokenStore()
    let errorMessage = ErrorMessageController()

    func fetchCurrentUser(_ currentUserStore: CurrentUserStore) {
        
        var request = URLRequest(url: URL(string: "\(Environment.apiUrl)users/me")!)
        let token = String(decoding: authTokenStore.read()!, as: UTF8.self)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data, error == nil else {
                print("Something went wrong!")
                return
            }
            
            do {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                let result = try decoder.decode(CurrentUser.self, from: data)
                currentUserStore.setCurrentUser(result)
                
            } catch {
                let decodedErrors =  self.errorMessage.decodeErrors(data: data)
                print("errors", decodedErrors)
                DispatchQueue.main.async {
                    self.errors = decodedErrors
                }
            }
        }
        task.resume()
    }
    
}
