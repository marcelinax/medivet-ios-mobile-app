//
//  MedivetPasswordInput.swift
//  Medivet
//
//  Created by Marcelina Sitko on 21/10/2022.
//

import SwiftUI

struct MedivetPasswordInput: View {
    var errors: [String]
    let value: Binding<String>
    @State private var isValueVisible: Bool = false
    
    init(value: Binding<String>, errors: [String]) {
        self.value = value
        self.errors = errors
    }
    
    @ViewBuilder func renderContent() -> some View {
        if isValueVisible {
            TextField(
                K.Inputs.password,
                text: value
            )
        }
        else  {
            SecureField(
                K.Inputs.password,
                text: value
            )
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
        HStack(alignment: .bottom) {
            renderContent()
                .padding(.horizontal)
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

