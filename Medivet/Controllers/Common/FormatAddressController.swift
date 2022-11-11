//
//  FormatAddressController.swift
//  Medivet
//
//  Created by Marcelina Sitko on 06/11/2022.
//

import UIKit

class FormatAddressController: UIViewController {
    
    func getAddress(street: String?, buildingNumber: Int?, flatNumber: Int?, zipCode: String?, city: String?) -> String {
        var result: String = ""
        if(street != nil) {
            result += street!
        }
        if(buildingNumber != nil) {
            result += " \(buildingNumber!)"
        }
        if(flatNumber != nil) {
            result += "/\(flatNumber!)"
        }
        if(zipCode != nil) {
            result += " \(zipCode!)"
        }
        if(city != nil) {
            result += ", \(city!)"
        }
        
        return result
    }
    
    func formatPostalCode(value: String, insertDashChar: Bool = false) -> String {
        var result: String = ""
    
        if value.count == 6 {
            return value
        }
        
        for (index, digit) in value.enumerated() {
            result += String(digit)
            if index == 1 {
                if !value.contains("-") && value.count > 1 && !insertDashChar {
                    result += "-"
                }
            }
    
        }

        return result
    }   
}
