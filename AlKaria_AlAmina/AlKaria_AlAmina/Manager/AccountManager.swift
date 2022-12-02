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
    
    var profile: ProfileModel? {
        get {
            if let savedProfile = UserDefaults.standard.object(forKey: "savedProfile") as? Data {
                if let loadedPerson = try? JSONDecoder().decode(ProfileModel.self, from: savedProfile) {
                    print(loadedPerson.name)
                    return loadedPerson
                }
                return nil
            }
            return nil
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: "savedProfile")
            }
        }
    }
    
    var settingsModel: SettingsModel?
}
