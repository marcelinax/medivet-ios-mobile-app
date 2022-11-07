//
//  FormNavigationLinkWithLabel.swift
//  Medivet
//
//  Created by Marcelina Sitko on 06/11/2022.
//

import SwiftUI

struct FormNavigationLinkWithLabel<ViewTarget: View>: View {
    let label: String
    let value: String
    let destination: ViewTarget
    
    var body: some View {
        NavigationLink(
            destination: destination,
            label: {
                HStack {
                    Text(label)
                    Spacer()
                    Text(value)
                        .foregroundColor(Color.gray)
                }
            }
        )
    }
}
