//
//  LoginScreen.swift
//  Medivet
//
//  Created by Marcelina Sitko on 11/10/2022.
//

import SwiftUI

struct LoginScreen: View {
    func printDupa() {
        print("dupa")
    }
    var body: some View {
        VStack {
            MedivetTextInput(icon: "x.circle.fill", placeholder: K.Inputs.email, action:printDupa)
                MedivetTextInput(icon: "eye.fill", placeholder: K.Inputs.password)
        }.padding()
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .frame(height: 1.0)
    }
}
