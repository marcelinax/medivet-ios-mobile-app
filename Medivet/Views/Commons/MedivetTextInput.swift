//
//  MedivetTextInput.swift
//  Medivet
//
//  Created by Marcelina Sitko on 11/10/2022.
//

import SwiftUI

struct MedivetTextInput: View {
    let icon: String?
    let placeholder: String?
    let action: (() -> Void)?
    
    init(icon: String? = nil, placeholder: String? = nil, action: (() -> Void)? = nil) {
        self.icon = icon
        self.placeholder = placeholder
        self.action = action
    }
    
    @ViewBuilder func renderIconContent() -> some View {
        if(icon != nil) {
            if(action != nil)  {
                  Button {
                      action!()
                  } label: { Image(systemName: icon!).foregroundColor(Color.gray)
                    .padding(.trailing, 30.0)
                }
            }
            else {
                 Image(systemName: icon!).foregroundColor(Color.gray)
                .padding(.trailing, 30.0)
            }
        }
    }
    
    var body: some View {
        HStack(alignment: .bottom) {
            TextField(
                placeholder ?? ""
                ,text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding(.horizontal)
            renderIconContent()
        }
        .overlay(VStack{
            Divider()
                .offset(y: 22)
                .padding()
        })
        .frame(height: 44.0)
    }
}
