//
//  DismissKeyboardController.swift
//  Medivet
//
//  Created by Marcelina Sitko on 29/10/2022.
//

import SwiftUI
import Foundation

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
