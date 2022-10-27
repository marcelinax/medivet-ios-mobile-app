//
//  UserRoleSelectionScreen.swift
//  Medivet
//
//  Created by Marcelina Sitko on 10/10/2022.
//

import SwiftUI

struct UserRoleSelectionScreen: View {
    @EnvironmentObject var createUserStore: CreateUserStore
    @State private var navigateToRegisterScreen: Bool = false
    
    func setRoleForSignedUpUser(_ role: UserRole) {
        createUserStore.setUserRole(role)
        navigateToRegisterScreen = true
    }
    
    var body: some View {
            VStack {
                Image(uiImage: UIImage(named: "AppIcon60x60") ?? UIImage())
                    .resizable()
                    .frame(width: 180, height: 180)
                    .padding(.bottom, 10)
                Text(Translations.Screens.SelectUserRole.continueAs)
                    .foregroundColor(Colors.secondary)
                    .fontWeight(.semibold)
                    .font(.system(size: 22))
                    .padding(.bottom, 30)
                NavigationLink(destination: RegisterScreen(), isActive: $navigateToRegisterScreen, label: {
                    MedivetButton(
                        title: EnumsTranslations.UserRole.vet,
                        backgroundColor: Colors.primary,
                        color: Color.white,
                        action: {
                            setRoleForSignedUpUser(UserRole.vet)
                        })
                    .padding(.bottom, 10)
                })
                NavigationLink(destination: RegisterScreen(), isActive: $navigateToRegisterScreen, label: {
                    MedivetButton(
                        title: EnumsTranslations.UserRole.patient,
                        backgroundColor: Colors.primary,
                        color: Color.white,
                        action: {
                            setRoleForSignedUpUser(UserRole.patient)
                        })
                })
            }.padding()
    }
}
