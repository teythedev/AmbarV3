//
//  KeyChainManager.swift
//  AmbarAPI
//
//  Created by Tugay on 9.11.2022.
//

import Foundation
import AuthenticationServices

final public class KeyChainManager {
    
    static public let standart = KeyChainManager()
    
    private init() {}
    
    
    
    
    
    public func save (_ value: String, service: String, account: String) {
        let data = Data(value.utf8)
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
    
        let saveStatus = SecItemAdd(query, nil)
        
        if saveStatus != errSecSuccess {
            print("Error: \(saveStatus)")
        }
        
        if saveStatus == errSecDuplicateItem {
            update(value, service: service, account: account)
        }
    }
    
    public func update(_ value: String, service: String, account: String) {
        let data = Data(value.utf8)
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
        
        let updateData = [kSecValueData: data] as CFDictionary
        
        SecItemUpdate(query, updateData)
    }
    
    public func read(service: String, account: String) -> String? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecReturnData: true
        ] as CFDictionary
        
        var result : AnyObject?
        
        SecItemCopyMatching(query, &result)
        guard let dataResult = result as? Data else { return nil }
        return String(data: dataResult, encoding: .utf8)
    }
    
    public func delete(service: String, account: String){
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
        
        SecItemDelete(query)
    }
    
    
}
