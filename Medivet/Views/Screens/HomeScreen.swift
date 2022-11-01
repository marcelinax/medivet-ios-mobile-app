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
    @StateObject private var homeScreenController = HomeScreenController()
    @EnvironmentObject var currentUserStore: CurrentUserStore
    @State private var goToUserProfile: Bool = false
    
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
            NavigationLink(destination: UserProfileScreen(currentUser: currentUserStore.getCurrentUser()), isActive: $goToUserProfile, label: {
                MedivetButton(title: "Profil", backgroundColor: Colors.primary, color: Color.white, action: ({
                    goToUserProfile = true
                }))
                    .padding()
            })
        }.onAppear(perform: ({
            homeScreenController.fetchCurrentUser(currentUserStore)
        }))
    }
}
