//
//  FormPostalCodeInput.swift
//  Medivet
//
//  Created by Marcelina Sitko on 11/11/2022.
//

import SwiftUI

struct FormPostalCodeInput: View {
    @Binding var value: String
    @State var prevValue: String = ""
    let isClearable: Bool?
    let isOptional: Bool?
    let formatAddressController = FormatAddressController()
    
    @ViewBuilder func renderClearIcon() -> some View {
        if isClearable! && value != "" {
            Button {
                clearValue()
            } label: { Image(systemName: "x.circle.fill").foregroundColor(Color.gray)
                    .padding(.leading, 10)
                    .buttonStyle(.borderless)
            }
        }
    }
    
    func clearValue() {
        value = ""
    }
    
    var body: some View {
        HStack {
            HStack {
                Text(Translations.Inputs.zipCode)
                    .frame(minWidth: 120, maxWidth: 120, alignment: .leading)
                Spacer()
                TextField(
                    isOptional == true ? Translations.Common.optional : "",
                    text: $value.max(6)
                ).onChange(of: value) { v in
                    if (value != formatAddressController.formatPostalCode(value: String(value))) {
                        value = formatAddressController.formatPostalCode(value: String(value), insertDashChar: prevValue.count > value.count)
                    }
                    prevValue = value;
                }.keyboardType(.numberPad)
            }
            Spacer()
            renderClearIcon()
        }
    }
}
