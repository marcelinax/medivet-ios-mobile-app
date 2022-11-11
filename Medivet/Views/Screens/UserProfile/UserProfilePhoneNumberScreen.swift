//
//  UserProfilePhoneNumberScreen.swift
//  Medivet
//
//  Created by Marcelina Sitko on 07/11/2022.
//

import SwiftUI

struct UserProfilePhoneNumberScreen: View {
    @EnvironmentObject var currentUserStore: CurrentUserStore
    
    var body: some View {
        Form {
            Section {
                FormPhoneNumberInput(
                    value: $currentUserStore.user.phoneNumber,
                    isClearable: true,
                    isOptional: true
                )
            }
        }
    }
}
