//
//  Extensions.swift
//  Medivet
//
//  Created by Marcelina Sitko on 04/11/2022.
//

import Foundation
import UIKit

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8){
            self.append(data)
        }
    }
}
