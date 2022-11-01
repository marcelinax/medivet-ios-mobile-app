//
//  Address.swift
//  Medivet
//
//  Created by Marcelina Sitko on 31/10/2022.
//

import Foundation

struct Address: Decodable {
    var city: String
    var street: String
    var buildingNumber: Int?
    var flatNumber: Int?
    var zipCode: String
}

