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
            MedivetTextInput(
                placeholder: K.Inputs.email,
                value: emailInputValue,
                errors: errorMessage.getErrors(errors: loginScreenController.errors, inputErrors: emailInputErrors),
                isClearable: true
            )
            MedivetPasswordInput(
                value: $passwordInputValue,
                errors: errorMessage.getErrors(errors: loginScreenController.errors, inputErrors: passwordInputErrors)
            )
            Button{
                
            } label: {
                Text(K.Buttons.forgotPassword)
            }.padding(.top, 25)
                .foregroundColor(Color.gray)
            MedivetButton(title: K.Buttons.signIn, backgroundColor: Colors.primary, color: Color.white, action: login)
                .padding(.top, 35)
            HStack{
                Text(K.Words.noAccountYet)
                    .foregroundColor(Colors.secondary)
                    .font(.system(size: 17))
                NavigationLink {
                    UserRoleSelectionScreen()
                } label: {
                    Text(K.Buttons.signUp)
                        .fontWeight(.semibold)
                        .foregroundColor(Colors.secondary)
                }.font(.system(size: 17))
            }.padding(.top, 25)
        }.padding()
    }
}
