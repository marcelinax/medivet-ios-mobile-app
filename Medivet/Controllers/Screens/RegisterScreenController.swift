//
//  RegisterScreenController.swift
//  Medivet
//
//  Created by Marcelina Sitko on 25/10/2022.
//

import UIKit

class RegisterScreenController: UIViewController, ObservableObject {
    @Published var errors: [String] = [""]
    let errorMessage = ErrorMessageController()
    let isoFormater = ISO8601DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    func signUp(email: String, password: String, name: String, birthDate: Date, gender: Gender, acceptTerms: Bool, role: UserRole) {
        let body: [String: Any] = [
            "email": email,
            "password": password,
            "name": name,
            "birthDate": birthDate.ISO8601Format(),
            "role": role.rawValue,
            "gender": gender.rawValue,
            "acceptTerms": acceptTerms
        ]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        var request = URLRequest(url: URL(string: "\(Environment.apiUrl)users")!)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data, error == nil else {
                print("Something went wrong!")
                return
            }
        
            do {
                let result = try JSONDecoder().decode(User.self, from: data)
            } catch {
                let decodedErrors =  self.errorMessage.decodeErrors(data: data)
                print(decodedErrors)
                
                DispatchQueue.main.async {
                    self.errors = decodedErrors
                }
            }
        }
        task.resume()
    }
    
    func toggleGenderPickerValue(_ value: Gender) -> Gender {
        if value == Gender.female {
            return Gender.male
        }
        else {
            return Gender.female
        }
    }

}
