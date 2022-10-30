//
//  LoginScreenController.swift
//  Medivet
//
//  Created by Marcelina Sitko on 12/10/2022.
//

import UIKit

class LoginScreenController: UIViewController, ObservableObject {
    @Published var errors: [String] = [""]
    @Published var canNavigateToHomeScreen: Bool = false
    let errorMessage = ErrorMessageController()
    let authTokenStore = AuthTokenStore()
    
    
    func signIn(email: String, password: String) {
        let body: [String: String] = ["email": email, "password": password]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        var request = URLRequest(url: URL(string: "\(Environment.apiUrl)auth/login")!)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data, error == nil else {
                print("Something went wrong!")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Auth.self, from: data)
                print("result", result)
                if result.access_token != "" {
                    DispatchQueue.main.async {
                        self.canNavigateToHomeScreen = true
                    }
                    self.authTokenStore.save(Data(result.access_token.utf8))
                }
            } catch {
                let decodedErrors =  self.errorMessage.decodeErrors(data: data)
                
                DispatchQueue.main.async {
                    self.errors = decodedErrors
                }
            }
        }
        task.resume()
    }
}
