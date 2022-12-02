//
//  menuModel.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 05/11/2022.
//

import Foundation

struct MenuModel: Codable {
    var image_name: String
    var title: String
    var message: String
}

struct GameMenuModel: Codable {
    var image_name: String
    var title: String
}

struct ColoringGameMenuModel: Codable {
    var image_name: String
    var title: String
    var id: Int
}

