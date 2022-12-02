//
//  NSObjectExtension.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 27/11/2022.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}

