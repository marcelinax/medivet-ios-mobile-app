//
//  MedivetPasswordInput.swift
//  Medivet
//
//  Created by Marcelina Sitko on 21/10/2022.
//

import SwiftUI

struct MedivetPasswordInput: View {
    @Binding var value: String
    var errors: [String]
    @State private var isValueVisible: Bool = false
    var hasIcon: Bool? = false
    
    @ViewBuilder func renderContent() -> some View {
        if isValueVisible {
            TextField(
                Translations.Inputs.password,
                text: $value
            )
        }
        else  {
            SecureField(
                Translations.Inputs.password,
                text: $value
            )
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
        HStack(alignment: .center) {
            if hasIcon == true {
                Image(systemName: "lock").foregroundColor(Color.gray)
                    .padding(.leading, 15)
            }
            renderContent()
                .padding(.horizontal, hasIcon == true ? 0 : nil)
            Button {
                isValueVisible.toggle()
            } label: {
                Image(systemName: isValueVisible ? "eye.fill" : "eye.slash.fill").foregroundColor(Color.gray)
                    .padding(.trailing, 30.0)
          }
        }
        .overlay(VStack{
            Divider()
                .offset(y: 22)
                .padding()
        })
        .frame(height: 44.0)
            if errors.count > 0 {
                MedivetErrorMessage(error: errors[0])
                    .padding(.leading)
            }
           
        }
    }
}

