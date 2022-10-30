//
//  KeychainStorage.swift
//  Medivet
//
//  Created by Marcelina Sitko on 29/10/2022.
//


import AuthenticationServices

final class AuthTokenStore {
    
    func save(_ token: Data) {
        let query = [
            kSecAttrAccount: "medivet",
            kSecValueData: token,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: "access_token"
        ] as CFDictionary
    
        let saveStatus = SecItemAdd(query, nil)
        
        if saveStatus == errSecDuplicateItem {
           update(token)
        }
        
        if saveStatus != errSecSuccess {
            print("error", saveStatus)
        }
         
    }
    
    func update(_ token: Data) {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: "access_token",
            kSecAttrAccount: "medivet",
        ] as CFDictionary
        
        let updatedToken = [kSecValueData: token] as CFDictionary
        SecItemUpdate(query, updatedToken)
    }
    
    func read() -> Data? {
        let query = [
            kSecAttrService: "access_token",
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: "medivet",
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        return result as? Data
    }
    
    func delete() {
        let query = [
            kSecAttrService: "access_token",
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: "medivet"
        ] as CFDictionary
        
        
        SecItemDelete(query)
    }
}
