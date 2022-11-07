//
//  FormNavigationLinkWithValue.swift
//  Medivet
//
//  Created by Marcelina Sitko on 06/11/2022.
//

import SwiftUI

struct FormNavigationLinkWithValue<TargetView: View>: View {
    let label: String
    let value: String
    let destination: TargetView
    
    var body: some View {
        NavigationLink {
           destination
        } label: {
            HStack {
                Text(label)
                Spacer()
                Text(value)
                    .foregroundColor(Color.gray)
            }
        }
    }
}
