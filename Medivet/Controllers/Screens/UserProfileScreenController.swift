//
//  UserProfileScreenController.swift
//  Medivet
//
//  Created by Marcelina Sitko on 01/11/2022.
//

import UIKit

class UserProfileScreenController: UIViewController, ObservableObject {
    @Published var errors: [String] = [""]
    let errorMessage = ErrorMessageController()
    private var authTokenStore = AuthTokenStore()
    
    
    func toggleGenderPickerValue(_ value: Gender) -> Gender {
        if value == Gender.female {
            return Gender.male
        }
        else {
            return Gender.female
        }
    }
    
    func updateUserProfilePhoto(image: UIImage, currentUserStore: CurrentUserStore) {
        var request: URLRequest = URLRequest(url: URL(string: "\(Environment.apiUrl)users/me/upload-profile-photo")!)
        let boundary = UUID().uuidString
        
        let token = String(decoding: authTokenStore.read()!, as: UTF8.self)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        var data = Data()
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\("file")\"; filename=\"\("superplik.png")\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = data
        
        URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else {
                print("Something went wrong!")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(ProfilePhoto.self, from: data)
                DispatchQueue.main.async {
                    currentUserStore.setCurrentUserProfilePhotoUrl(result.profilePhotoUrl)
                }
            } catch {
                let decodedErrors =  self.errorMessage.decodeErrors(data: data)
                print(decodedErrors)
                
                DispatchQueue.main.async {
                    self.errors = decodedErrors
                }
            }
        }).resume()
    }
    
    func removeUserProfilePhoto(currentUserStore: CurrentUserStore) {
        var request: URLRequest = URLRequest(url: URL(string: "\(Environment.apiUrl)users/me/remove-profile-photo")!)
        request.httpMethod = "DELETE"
        
        let token = String(decoding: authTokenStore.read()!, as: UTF8.self)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else {
                print("Something went wrong!")
                return
            }
            
            do {
                DispatchQueue.main.async {
                    currentUserStore.setCurrentUserProfilePhotoUrl("")
                }
            } catch {
                let decodedErrors =  self.errorMessage.decodeErrors(data: data)
                print(decodedErrors)
                
                DispatchQueue.main.async {
                    self.errors = decodedErrors
                }
            }
        }).resume()
    }
    
}
