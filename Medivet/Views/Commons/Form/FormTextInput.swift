//
//  FormInput.swift
//  Medivet
//
//  Created by Marcelina Sitko on 06/11/2022.
//

import SwiftUI

struct FormTextInput: View {
    let label: String
    @Binding var value: String
    let isClearable: Bool?
    let isOptional: Bool?
    
    @ViewBuilder func renderClearIcon() -> some View {
        if isClearable! && value != "" {
            Button {
                clearValue()
            } label: { Image(systemName: "x.circle.fill").foregroundColor(Color.gray)
                    .padding(.leading, 10)
            }.buttonStyle(.borderless)
        }
    }
    
    func clearValue() {
        value = ""
    }
    
    var body: some View {
        HStack {
            HStack {
                Text(label)
                    .frame(minWidth: 120, maxWidth: 120, alignment: .leading)
                Spacer()
                TextField(
                    isOptional == true ? Translations.Common.optional : "",
                    text: $value
                )
            }
            Spacer()
            renderClearIcon()
        }
    }
}
