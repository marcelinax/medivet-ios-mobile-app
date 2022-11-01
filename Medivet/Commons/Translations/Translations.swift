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
        }
    }
    
    struct Inputs {
        static let email = "Email"
        static let password = "Hasło"
        static let name = "Imię i nazwisko"
        static let birthDate = "Data urodzenia"
    }
    
    struct Navigation {
        static let userProfile = "Profil użytkownika"
    }
}
