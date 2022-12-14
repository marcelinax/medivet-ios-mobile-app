//
//  RegisterScreen.swift
//  Medivet
//
//  Created by Marcelina Sitko on 23/10/2022.
//

import SwiftUI
import UIKit
import Foundation

struct RegisterScreen: View {
    let dateFormatter = DateFormatter()
    @State private var emailValueInput: String = ""
    @State private var passwordValueInput: String = ""
    @State private var nameValueInput: String = ""
    @State private var birthDateValueInput: Date = Calendar.current.date(byAdding: DateComponents(year: -18), to: Date()) ?? Date()
    @State private var initialBirthDateValue: String = Calendar.current.date(byAdding: DateComponents(year: -18), to: Date())?.formatted(.dateTime.day().month().year()) ?? Date().formatted(.dateTime.day())
    @State private var selectedGender: Gender = Gender.male
    @State private var acceptTerms: Bool = false
    @EnvironmentObject var createUserStore: CreateUserStore
    @StateObject var registerScreenController = RegisterScreenController()
    @State private var invalidAttempts = 0
    var errorMessage = ErrorMessageController()
    
    private let passwordInputErrors: [String] = [
        ErrorMessages.passwordMustBeLongerThanOrEqualTo6Characters,
        ErrorMessages.passwordShouldNotBeEmpty,
    ]
    
    private let emailInputErrors: [String] = [
        ErrorMessages.emailMustBeAnEmail,
        ErrorMessages.userWithThisEmailAlreadyExists
    ]
    
    private let nameInputErrors: [String] = [
        ErrorMessages.nameShouldNotBeEmpty
    ]
    
    private let birthDateInputErrors: [String] = [
        ErrorMessages.birthDateShouldNotBeEmpty,
        ErrorMessages.userHasToBeAtLeast18YearsOfAge,
        ErrorMessages.birthDateCannotBeLaterThanToday
    ]
    
    private let acceptTermsErrors: [String] = [
        ErrorMessages.termsAreNotAccepted
    ]
    
    func showDatePickerAlert() {
        let alertVC = UIAlertController(title: "\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        let datePicker: UIDatePicker = UIDatePicker(frame: CGRect(
            x: 0,
            y: 0,
            width: Sizes.screenWidth,
            height: 216
        ))
        datePicker.date = birthDateValueInput
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        alertVC.view.addSubview(datePicker)
        
        let okAction = UIAlertAction(title: Translations.Common.confirm, style: .default) { _ in
            if initialBirthDateValue != "" {
                initialBirthDateValue = ""
            }
            dateFormatter.dateStyle = .short
            dateFormatter.locale = Locale(identifier: "pl_PL")
            birthDateValueInput = datePicker.date
        }
        alertVC.addAction(okAction)
        let cancelAction = UIAlertAction(title: Translations.Common.cancel, style: .cancel)
        alertVC.addAction(cancelAction)
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        window?.rootViewController?.present(alertVC, animated: true, completion: nil)
    }
    
    func register() {
        self.dismissKeyboard()
        registerScreenController.signUp(
            email: emailValueInput,
            password: passwordValueInput,
            name: nameValueInput,
            birthDate: birthDateValueInput,
            gender: selectedGender,
            acceptTerms: acceptTerms,
            role: createUserStore.user.role
        )
        if (errorMessage.getErrors(errors: registerScreenController.errors, inputErrors: acceptTermsErrors).count > 0
        || acceptTerms == false) {
            withAnimation(.default) {
                self.invalidAttempts += 1
            }
        }
    }
    // pomy??lec o clearowaniu b????d??w na zmian?? input value
    // poprawi?? layout
    
    var body: some View {
        ScrollView {
        VStack(alignment: .center, spacing: 0) {
            VStack {
                Image(uiImage: UIImage(named: "Cat") ?? UIImage())
                    .resizable()
                    .frame(width: 250, height: 200)
                    .aspectRatio(contentMode: .fit)
                Text(Translations.Common.medivet)
                    .foregroundColor(Colors.primary)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
            }.padding(.bottom, 30)
            MedivetTextInput(
                errors: errorMessage.getErrors(errors: registerScreenController.errors, inputErrors: emailInputErrors),
                isClearable: true,
                placeholder: Translations.Inputs.email,
                value: $emailValueInput,
                icon: "envelope"
            ).keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.bottom, 12)
            MedivetPasswordInput(
                value: $passwordValueInput,
                errors: errorMessage.getErrors(errors: registerScreenController.errors, inputErrors: passwordInputErrors),
                hasIcon: true
            ).padding(.bottom, 12)
                .autocapitalization(.none)
            MedivetTextInput(
                errors: errorMessage.getErrors(errors: registerScreenController.errors, inputErrors: nameInputErrors),
                isClearable: true,
                placeholder: Translations.Inputs.name,
                value: $nameValueInput,
                icon: "person"
            ).padding(.bottom, 12)
            Button(action: {
                showDatePickerAlert()
            }) {
                MedivetTextInput(
                    errors: errorMessage.getErrors(errors: registerScreenController.errors, inputErrors: birthDateInputErrors),
                    isClearable: false,
                    placeholder: Translations.Inputs.birthDate,
                    value: initialBirthDateValue != "" ? Binding.constant(initialBirthDateValue) : Binding.constant(dateFormatter.string(from: birthDateValueInput)),
                    icon: "calendar"
                ).onTapGesture(perform: {
                    showDatePickerAlert()
                }).padding(.bottom, 12)
                    .disabled(true)
                .multilineTextAlignment(.leading)  
            }
            Picker("", selection: $selectedGender) {
                Text(EnumsTranslations.Gender.male).tag(Gender.male)
                Text(EnumsTranslations.Gender.female).tag(Gender.female)
            }.pickerStyle(.segmented)
                .padding(.bottom, 30)
            HStack {
                Toggle("", isOn: $acceptTerms)
                    .toggleStyle(.switch)
                    .labelsHidden()
                    .tint(Colors.green)
                    .modifier(Shake(animatableData: CGFloat(invalidAttempts)))
                Text(Translations.Screens.Register.acceptTerms)
                    .font(.system(size: 12))
                    .foregroundColor(invalidAttempts > 0 ? .red : .black)
            }
            MedivetButton(title: Translations.Screens.Register.signUp, backgroundColor: Colors.primary, color: Color.white, action: register)
                .padding(.top, 35)
            HStack{
                Text(Translations.Screens.Register.haveAccountAlready)
                    .foregroundColor(Colors.secondary)
                    .font(.system(size: 17))
                NavigationLink {
                    LoginScreen()
                } label: {
                    Text(Translations.Screens.Register.signIn)
                        .fontWeight(.semibold)
                        .foregroundColor(Colors.secondary)
                }.font(.system(size: 17))
            }.padding(.top, 25)
        }.padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
        .onAppear {
            UIScrollView.appearance().keyboardDismissMode = .onDrag
            UIApplication.shared.handleKeyboard()
        }
    }
}

class TextFieldDeleage: NSObject, UIApplicationDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
      return false
    }
}
