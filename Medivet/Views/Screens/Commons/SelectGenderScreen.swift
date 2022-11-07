//
//  SelectGenderScreen.swift
//  Medivet
//
//  Created by Marcelina Sitko on 06/11/2022.
//

import SwiftUI

struct SelectGenderScreen: View {
    let isPerson: Bool
    @Binding var selectedGender: Gender
    
    var body: some View {
        Form {
            Section {
                VStack {
                    Picker("", selection: $selectedGender) {
                        Text(isPerson ? EnumsTranslations.Gender.male : EnumsTranslations.Gender.petMale).tag(Gender.male)
                        Text(isPerson ? EnumsTranslations.Gender.female : EnumsTranslations.Gender.petFemale).tag(Gender.female)
                        Text("cwel")
                    }.pickerStyle(.automatic)
                }
                
            }
        }.navigationTitle(Translations.Screens.SelectGender.selectGender)
    }
}
