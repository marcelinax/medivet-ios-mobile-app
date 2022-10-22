//
//  ErrorMessageController.swift
//  Medivet
//
//  Created by Marcelina Sitko on 13/10/2022.
//

import UIKit

class ErrorMessageController: ObservableObject {

    func parseErrorMessage(errorMessage: String) -> String {
            let errorMessageWords = errorMessage.replacingOccurrences(of: ".", with: "").split(separator: " ")
            let result = errorMessageWords.enumerated().map{ (index, word) -> String in
            let firstLetter: String = index == 0 ? word.prefix(1).lowercased() : word.prefix(1).uppercased()
            let otherLetters: String = String(word.dropFirst())
            
            return firstLetter + otherLetters
        }
        return result.joined()
    }
    
    func getTranslatedErrorMessage(errorMessage: String) -> String {
        let errorMessageTranslations = ErrorMessageTranslations()
        let errorMessageToParse = parseErrorMessage(errorMessage: errorMessage)
        
        let errorMessagesMirror = Mirror(reflecting: errorMessageTranslations)

        let errorMessagesArray = errorMessagesMirror.children.map { $0 }

        if let message = errorMessagesArray.first(where: {$0.label == errorMessageToParse}) {
            return message.value as! String
        }
       return ""
    }
    
    func getError(errors: [String], error: String) -> String {
        return errors.contains(error) ? getTranslatedErrorMessage(errorMessage: error) : ""
    }
    
    func getErrors(errors: [String], inputErrors: [String]) -> [String] {
        let newErrors =  errors.map{error in
            return inputErrors.contains(error) ? getTranslatedErrorMessage(errorMessage: error) : ""
        }
        return newErrors.count > 0 ? newErrors.filter{ $0 != ""} : [""]
    }
    
    func decodeErrors(data: Data) -> [String] {
        let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        let strMessage = json?["message"] as? String ?? ""
        return  json?["message"] as? [String] ?? (strMessage != "" ? [strMessage] : [])
    }
}
