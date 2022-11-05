//
//  SignUpUserData.swift
//  Medivet
//
//  Created by Marcelina Sitko on 23/10/2022.
//

import Foundation

struct CreateUser {
    var role: UserRole
    var password: String
    var name: String
    var gender: Gender
    var birthDate: Date
    var email: String
    var acceptTerms: Bool
}
