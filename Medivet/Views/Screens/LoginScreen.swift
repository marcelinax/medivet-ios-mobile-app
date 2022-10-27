//
//  LoginScreen.swift
//  Medivet
//
//  Created by Marcelina Sitko on 11/10/2022.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var loginScreenController = LoginScreenController()
    var errorMessage = ErrorMessageController()
    @State private var emailInputValue: String = ""
    @State private var passwordInputValue: String = ""
    
    private let emailInputErrors: [String] = [
        ErrorMessages.userWithThisEmailDoesNotExist,
        ErrorMessages.emailMustBeAnEmail,
    ]
    
    private let passwordInputErrors: [String] = [
        ErrorMessages.wrongPassword,
        ErrorMessages.passwordShouldNotBeEmpty,
    ]
    
    func login() {
        loginScreenController.signIn(email: emailInputValue, password: passwordInputValue)
    }
    
    var body: some View {
        VStack {
            VStack {
                Image(uiImage: UIImage(named: "Dog") ?? UIImage())
                    .resizable()
                    .frame(width: 250, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 16)
                Text(Translations.Common.medivet)
                    .foregroundColor(Colors.primary)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
            }.padding(.bottom, 30)
            MedivetTextInput(
                errors: errorMessage.getErrors(errors: loginScreenController.errors, inputErrors: emailInputErrors),
                isClearable: true,
                placeholder: Translations.Inputs.email,
                value: $emailInputValue,
                icon: "envelope"
            ).keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.bottom, 15)
            MedivetPasswordInput(
                value: $passwordInputValue,
                errors: errorMessage.getErrors(errors: loginScreenController.errors, inputErrors: passwordInputErrors),
                hasIcon: true
            ).autocapitalization(.none)
            Button{
                
            } label: {
                Text(Translations.Screens.Login.forgotPassword)
            }.padding(.top, 25)
                .foregroundColor(Color.gray)
            MedivetButton(title: Translations.Screens.Login.signIn, backgroundColor: Colors.primary, color: Color.white, action: login)
                .padding(.top, 35)
            HStack{
                Text(Translations.Screens.Login.noAccountYet)
                    .foregroundColor(Colors.secondary)
                    .font(.system(size: 17))
                NavigationLink {
                    UserRoleSelectionScreen()
                } label: {
                    Text(Translations.Screens.Login.signUp)
                        .fontWeight(.semibold)
                        .foregroundColor(Colors.secondary)
                }.font(.system(size: 17))
            }.padding(.top, 25)
        }.padding()
    }
}
