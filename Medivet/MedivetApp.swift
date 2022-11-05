//
//  MedivetApp.swift
//  Medivet
//
//  Created by Marcelina Sitko on 10/10/2022.
//

import SwiftUI

@main
struct MedivetApp: App {
    @StateObject var createUserStore = CreateUserStore()
    @StateObject var currentUserStore = CurrentUserStore()
    var authTokenStore = AuthTokenStore()
    @State private var isUserAuthenticated: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                isUserAuthenticated ? AnyView(HomeScreen()) : AnyView(LoginScreen())
            }.environmentObject(createUserStore)
                .environmentObject(currentUserStore)
                .onAppear(perform: ({
                    if authTokenStore.read() != nil {
                        isUserAuthenticated = true
                    }
                    else {
                        isUserAuthenticated = false
                    }
                }))
        }
    }
}
