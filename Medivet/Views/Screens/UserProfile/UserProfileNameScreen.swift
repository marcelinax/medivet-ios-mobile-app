//
//  UserProfileNameScreen.swift
//  Medivet
//
//  Created by Marcelina Sitko on 12/11/2022.
//

import SwiftUI

struct UserProfileNameScreen: View {
    @EnvironmentObject var currentUserStore: CurrentUserStore
    
    var body: some View {
        Form {
            Section {
                FormTextInput(
                    label: Translations.Inputs.name,
                    value: $currentUserStore.user.name,
                    isClearable: true,
                    isOptional: false
                )
            }
        }
    }
}

