//
//  CurrentUser.swift
//  Medivet
//
//  Created by Marcelina Sitko on 31/10/2022.
//

import Foundation

struct CurrentUser: Decodable {
    let role: UserRole
    let name: String
    let gender: Gender
    let birthDate: Date
    let phoneNumber: String
    let profilePhotoUrl: String
    let address: Address
    //    var specializations: [String]
    //    var clinics: [String]
}
