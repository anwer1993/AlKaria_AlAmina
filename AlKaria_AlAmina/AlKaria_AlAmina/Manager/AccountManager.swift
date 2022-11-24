//
//  AccountManager.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 09/11/2022.
//

import Foundation


class AccountManager {
    
    static var shared = AccountManager()
    
    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: "token")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "token")
            UserDefaults.standard.synchronize()
        }
    }
    
    var profile: ProfileModel?
    
    var settingsModel: SettingsModel?
}
