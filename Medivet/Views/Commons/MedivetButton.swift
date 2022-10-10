//
//  MedivetButton.swift
//  Medivet
//
//  Created by Marcelina Sitko on 10/10/2022.
//

import SwiftUI

struct MedivetButton: View {
    let title: String
    let backgroundColor: Color
    let color: Color
    let fontSize: CGFloat = 17
    let action: () -> Void
    
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
            .padding()
            .font(.system(size: fontSize))
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .background(backgroundColor)
        .foregroundColor(color)
        .cornerRadius(10)
    }
}
