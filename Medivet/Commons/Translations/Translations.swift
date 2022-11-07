//
//  Constants.swift
//  Medivet
//
//  Created by Marcelina Sitko on 10/10/2022.
//

import UIKit

struct Translations {
    struct Common {
        static let medivet = "MediVet"
        static let cancel = "Anuluj"
        static let confirm = "Zatwierdź"
        static let optional = "Opcjonalnie"
    }
    
    struct Screens {
        struct Register {
            static let signIn = "Zaloguj się"
            static let signUp = "Zarejestruj się"
            static let acceptTerms = "Zapoznałem się z regulaminem i akceptuję warunki"
            static let haveAccountAlready = "Masz już konto?"
        }
        
        struct Login {
            static let noAccountYet = "Nie masz jeszcze konta?"
            static let forgotPassword = "Zapomniałeś hasła?"
            static let signIn = "Zaloguj się"
            static let signUp = "Zarejestruj się"
        }
        
        struct SelectUserRole {
            static let continueAs = "Kontynuuj jako"
        }
        
        struct UserProfile {
            static let editProfilePhoto = "EDYTUJ ZDJĘCIE"
            static let chooseProfilePhoto = "Wybierz zdjęcie"
            static let removeProfilePhoto = "Usuń zdjęcie"
        }
        
        struct SelectGender {
            static let selectGender = "Wybierz płeć"
        }
    }
    
    struct Inputs {
        static let email = "Email"
        static let password = "Hasło"
        static let name = "Imię i nazwisko"
        static let birthDate = "Data urodzenia"
        static let gender = "Płeć"
        static let address = "Adres"
        static let phoneNumber = "Numer telefonu"
        static let city = "Miasto"
        static let street = "Ulica"
        static let buildingNumber = "Nr budynku"
        static let flatNumber = "Nr mieszkania"
        static let zipCode = "Kod pocztowy"
    }
    
    struct Navigation {
        static let userProfile = "Profil użytkownika"
    }
}
