//
//  UserRoleSelectionScreen.swift
//  Medivet
//
//  Created by Marcelina Sitko on 10/10/2022.
//

import SwiftUI

struct UserRoleSelectionScreen: View {
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "AppIcon60x60") ?? UIImage())
                .resizable()
                .frame(width: 180, height: 180)
                .padding(.bottom, 10)
            Text(K.Words.continueAs)
                .foregroundColor(Colors.secondary)
                .fontWeight(.semibold)
                .font(.system(size: 22))
                .padding(.bottom, 30)
            MedivetButton(
                title: K.Words.vet,
                backgroundColor: Colors.primary,
                color: Color.white,
                action: {
                    print("Przejdź na widok rejestracji weterynarza")
                })
            .padding(.bottom, 10)
            MedivetButton(
                title: K.Words.patient,
                backgroundColor: Colors.primary,
                color: Color.white,
                action: {
                    print("Przejdź na widok rejestracji pacjenta")
                })
        }.padding()
    }
}
