//
//  TabbarItemEnum.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 01/11/2022.
//

import Foundation

enum TabbarItem: String {
    case Home = "Home"
    case Stories = "stories"
    case Games = "games"
    case Friends = "friends"
    case Partners = "partners"
    
    var selectedItem: Int {
        switch self {
        case .Home:
            return 0
        case .Stories:
            return 1
        case .Games:
            return 2
        case .Friends:
            return 3
        case .Partners:
            return 4
        }
    }
}
