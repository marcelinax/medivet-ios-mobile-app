//
//  ErrorMessages.swift
//  Medivet
//
//  Created by Marcelina Sitko on 21/10/2022.
//

import Foundation

struct ErrorMessages {
    static let userWithThisEmailDoesNotExist = "User with this email does not exist."
    static let wrongPassword = "Wrong password."
    static let emailMustBeAnEmail = "email must be an email"
    static let passwordShouldNotBeEmpty = "password should not be empty"
    static let passwordMustBeLongerThanOrEqualTo6Characters = "password must be longer than or equal to 6 characters"
    static let nameShouldNotBeEmpty = "name should not be empty"
    static let birthDateShouldNotBeEmpty = "birthDate should not be empty"
    static let userWithThisEmailAlreadyExists = "User with this email already exists."
    static let userHasToBeAtLeast18YearsOfAge = "User has to be at least 18 years of age."
    static let birthDateCannotBeLaterThanToday = "Birth date cannot be later than today."
    static let termsAreNotAccepted = "Terms are not accepted"
}
