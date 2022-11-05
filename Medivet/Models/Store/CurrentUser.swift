//
//  CurrentUser.swift
//  Medivet
//
//  Created by Marcelina Sitko on 31/10/2022.
//

import Foundation

struct CurrentUser: Decodable {
    let role: UserRole
    var name: String
    var gender: Gender
    var birthDate: Date
    var phoneNumber: String
    var profilePhotoUrl: String
    var address: Address
    //    var specializations: [String]
    //    var clinics: [String]
}
