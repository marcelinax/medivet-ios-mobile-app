//
//  UserProfileAddressScreen.swift
//  Medivet
//
//  Created by Marcelina Sitko on 06/11/2022.
//

import SwiftUI

struct UserProfileAddressScreen: View {
    @EnvironmentObject var currentUserStore: CurrentUserStore
    
    var body: some View {
        Form{
            Section {
                FormTextInput(
                    label: Translations.Inputs.city,
                    value: $currentUserStore.user.address.city,
                    isClearable: false,
                    isOptional: false,
                )
                FormTextInput(
                    label: Translations.Inputs.street,
                    value: $currentUserStore.user.address.street,
                    isClearable: false,
                    isOptional: false
                )
                FormNumberInput(
                    label: Translations.Inputs.buildingNumber,
                    value: $currentUserStore.user.address.buildingNumber,
                    isClearable: false,
                    isOptional: false
                )
                FormNumberInput(
                    label: Translations.Inputs.flatNumber,
                    value: $currentUserStore.user.address.flatNumber,
                    isClearable: true,
                    isOptional: true
                )
                FormTextInput(
                    label: Translations.Inputs.zipCode,
                    value: $currentUserStore.user.address.zipCode,
                    isClearable: false,
                    isOptional: false
                )
            }
        }
    }
}


