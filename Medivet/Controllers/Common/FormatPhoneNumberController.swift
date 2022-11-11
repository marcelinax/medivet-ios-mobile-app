//
//  FormatPhoneNumberController.swift
//  Medivet
//
//  Created by Marcelina Sitko on 11/11/2022.
//

import UIKit

class FormatPhoneNumberController: UIViewController {
    
    func formatPhoneNumber(value: String, insertSpaceChar: Bool = false) -> String {
        var result: String = ""
        
        if value.count == 11 {
            return value
        }
        
        for (index, digit) in value.enumerated() {
            result += String(digit)
            
            if index == 2 {
                if  (value.count > 2 && value.count <= 3 && !insertSpaceChar)  {
                    result += " "
                }
            }
            
            if  index == 6  {
                if  (value.count > 6 && value.count <= 7 && !insertSpaceChar)  {
                    result += " "
                }
            }
            
        }
        
        return result
    }
    
}
