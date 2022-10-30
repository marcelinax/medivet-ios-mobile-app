//
//  HomeScreen.swift
//  Medivet
//
//  Created by Marcelina Sitko on 30/10/2022.
//

import SwiftUI

struct HomeScreen: View {
    private var authTokenStore = AuthTokenStore()
    @State private var isUserAuthenticated: Bool = true
    
    func logout() {
        authTokenStore.delete()
        isUserAuthenticated = false
    }
    
    var body: some View {
        VStack{
            Text("Home")
            NavigationLink(destination: LoginScreen(), isActive: isUserAuthenticated ? Binding.constant(false) : Binding.constant(true), label: {
                MedivetButton(title: "wyloguj", backgroundColor: Colors.primary, color: Color.white, action: logout)
                    .padding(.top, 10)
            }).navigationBarBackButtonHidden(true)
                .padding()
        }
    }
}
