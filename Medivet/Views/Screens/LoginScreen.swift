//
//  LoginScreen.swift
//  Medivet
//
//  Created by Marcelina Sitko on 11/10/2022.
//

import SwiftUI

struct LoginScreen: View {
    
    func login() {
        print("login")
    }
   
    var body: some View {
        VStack {
            MedivetTextInput(icon: "x.circle.fill", placeholder: K.Inputs.email)
            MedivetTextInput(icon: "eye.fill", placeholder: K.Inputs.password)
            Button{
                
            } label: {
                Text(K.Buttons.forgotPassword)
            }.padding(.top, 25)
                .foregroundColor(Color.gray)
            MedivetButton(title: K.Buttons.signIn, backgroundColor: Colors.primary, color: Color.white, action: login)
                .padding(.top, 35)
            HStack{
                Text(K.Words.noAccountYet)
                    .foregroundColor(Colors.secondary)
                    .font(.system(size: 17))
                Button{
                    
                } label: {
                    Text(K.Buttons.signUp)
                        .fontWeight(.semibold)
                        .foregroundColor(Colors.secondary)
                }.font(.system(size: 17))
            }.padding(.top, 25)
        }.padding()
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .frame(height: 1.0)
    }
}
