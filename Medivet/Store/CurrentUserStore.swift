//
//  Auth.swift
//  Medivet
//
//  Created by Marcelina Sitko on 31/10/2022.
//

import Foundation

final class CurrentUserStore: ObservableObject {
    @Published var user: CurrentUser =  CurrentUser(
        role: UserRole.patient,
        name: "",
        gender: Gender.male,
        birthDate: Date(),
        phoneNumber: "",
        profilePhotoUrl: "",
        address: Address(
        city: "",
        street: "",
        buildingNumber: 0,
        flatNumber: 0,
        zipCode: ""
        )
    )
    
    func setCurrentUser(_ user: CurrentUser) {
        self.user = user
    }
    
    func getCurrentUser() -> CurrentUser {
        return self.user
    }
}
