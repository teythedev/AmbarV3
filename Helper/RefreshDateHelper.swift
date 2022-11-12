//
//  RefreshDateHelper.swift
//  AmbarAPI
//
//  Created by Tugay on 10.11.2022.
//

import Foundation

final public class RefreshDateHelper {
    
    static public let standart = RefreshDateHelper()
    
    private init() {}
    
    let defaults = UserDefaults.standard
    
    public func saveIDTokenExpireDate() {
        
        let expireDate = Date.now.addingTimeInterval(3600)
        defaults.set(expireDate, forKey: "id-token-expire-date")
        
    }
    
    public func shouldRefreshIDToken() -> Bool {
        if let expireData = defaults.object(forKey: "id-token-expire-date") as? Date {
            if expireData < Date.now {
                return true
            }else {
                return false
            }
        }        
        return false
    }
    
    
}
