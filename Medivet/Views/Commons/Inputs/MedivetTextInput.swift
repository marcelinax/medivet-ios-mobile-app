//
//  MedivetTextInput.swift
//  Medivet
//
//  Created by Marcelina Sitko on 11/10/2022.
//

import SwiftUI

struct MedivetTextInput: View {
    var errors: [String]
    let isClearable: Bool?
    let placeholder: String?
    @Binding var value: String
    
    @ViewBuilder func renderClearIcon() -> some View {
        if isClearable! {
            Button {
                clearValue()
            } label: { Image(systemName: "x.circle.fill").foregroundColor(Color.gray)
              .padding(.trailing, 30.0)
          }
        }
    }
    
    func clearValue() {
        value = ""
    }
    
    var body: some View {
        VStack(alignment: .leading){
        HStack(alignment: .bottom) {
            TextField(
                 placeholder ?? "",
                 text: $value
             )
                .padding(.horizontal)
            renderClearIcon()
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
