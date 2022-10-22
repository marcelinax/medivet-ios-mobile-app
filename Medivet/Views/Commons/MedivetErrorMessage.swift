//
//  Error.swift
//  Medivet
//
//  Created by Marcelina Sitko on 13/10/2022.
//

import SwiftUI

struct MedivetErrorMessage: View {
    var error: String
    
    var body: some View {
        if(error != "") {
        Text(error)
            .font(.system(size: 13))
            .foregroundColor(Color.red)
            .multilineTextAlignment(.leading)
        }
    }
}
