//
//  FormNumberInput.swift
//  Medivet
//
//  Created by Marcelina Sitko on 06/11/2022.
//

import SwiftUI

struct FormNumberInput: View {
    let label: String
    @Binding var value: Int?
    let isClearable: Bool?
    
    @ViewBuilder func renderClearIcon() -> some View {
        if isClearable! {
            Button {
                clearValue()
            } label: { Image(systemName: "x.circle.fill").foregroundColor(Color.gray)
                    .padding(.leading, 10)
            }.buttonStyle(.borderless)
        }
    }
    
    func clearValue() {
        value = nil
    }
    
    var body: some View {
        HStack {
            HStack{
                Text(label)
                    .frame(minWidth: 120, maxWidth: 120, alignment: .leading)
                Spacer()
                TextField(
                    Translations.Common.optional,
                    text: Binding<String>(get: {
                        if value == nil {
                            return ""
                        }
                        return "\(value!)"
                    }, set: { String in
                        value = Int(String)
                    })).keyboardType(.numberPad)
            }
            renderClearIcon()
        }
    }
}
