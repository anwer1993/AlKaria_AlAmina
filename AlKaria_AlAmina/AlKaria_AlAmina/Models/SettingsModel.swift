//
//  SettingsModel.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 17/11/2022.
//

import Foundation


// MARK: - ProfileModel
struct SettingsModel: Codable {
    
    let about, terms, versionAndroid: String?

    enum CodingKeys: String, CodingKey {
        case about, terms
        case versionAndroid = "version_android"
    }
}
