//
//  CGFloatExtension.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 23/11/2022.
//

import Foundation

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
