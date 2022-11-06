//
//  FormButtonWithLabelAndValue.swift
//  Medivet
//
//  Created by Marcelina Sitko on 05/11/2022.
//

import SwiftUI

struct FormButtonWithLabelAndValue: View {
    let label: String
    let action: () -> Void
    var value: String
    
    
    var body: some View {
        Button() {
           action()
        } label: {
            HStack {
                Text(label)
                    .foregroundColor(Color.black)
                Spacer()
                Text(value)
                    .foregroundColor(Color.gray)
            }
        }
    }
}


