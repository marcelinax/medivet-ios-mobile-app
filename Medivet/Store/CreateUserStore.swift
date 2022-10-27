//
//  SignUpUserDataStore.swift
//  Medivet
//
//  Created by Marcelina Sitko on 23/10/2022.
//

import Foundation

final class CreateUserStore: ObservableObject {
    @Published var user: CreateUser =  CreateUser(
        role: UserRole.patient,
        password: "",
        name: "",
        gender: Gender.male,
        birthDate: Date(),
        email: "",
        acceptTerms: false
    )
    
    func setUserRole(_ role: UserRole) {
        user.role = role
    }
}
