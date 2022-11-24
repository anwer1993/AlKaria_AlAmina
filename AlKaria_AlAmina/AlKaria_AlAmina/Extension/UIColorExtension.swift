//
//  UIColorExtension.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 02/11/2022.
//

import Foundation
import UIKit

extension UIColor {
    
    @nonobjc class var grapePurple: UIColor {
        return UIColor(red: 39.0 / 255.0, green: 19.0 / 255.0, blue: 68.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var offWhite: UIColor {
        return UIColor(red: 1.0, green: 245.0 / 255.0, blue: 229.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var whiteTwo: UIColor {
        return UIColor(white: 252.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var red20: UIColor {
        return UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.2)
    }
    @nonobjc class var warmPink: UIColor {
        return UIColor(red: 253.0 / 255.0, green: 72.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var pinkRed: UIColor {
        return UIColor(red: 1.0, green: 0.0, blue: 78.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var black8: UIColor {
        return UIColor(white: 0.0, alpha: 0.08)
    }
    @nonobjc class var azure: UIColor {
        return UIColor(red: 7.0 / 255.0, green: 171.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var red: UIColor {
        return UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }
    @nonobjc class var black85: UIColor {
        return UIColor(white: 0.0, alpha: 0.05)
    }
    @nonobjc class var appleGreen: UIColor {
        return UIColor(red: 135.0 / 255.0, green: 194.0 / 255.0, blue: 35.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var brownishGrey: UIColor {
        return UIColor(white: 102.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var brightSkyBlue: UIColor {
        return UIColor(red: 0.0, green: 185.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    @nonobjc class var brightSkyBlue18: UIColor {
        return UIColor(red: 0.0, green: 185.0 / 255.0, blue: 1.0, alpha: 0.18)
    }
    @nonobjc class var orangeyRed18: UIColor {
        return UIColor(red: 1.0, green: 78.0 / 255.0, blue: 54.0 / 255.0, alpha: 0.18)
    }
    @nonobjc class var paleSkyBlue: UIColor {
        return UIColor(red: 178.0 / 255.0, green: 234.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    @nonobjc class var pinkRed1020: UIColor {
        return UIColor(red: 1.0, green: 0.0, blue: 78.0 / 255.0, alpha: 0.2)
    }
    @nonobjc class var peachyPink: UIColor {
        return UIColor(red: 1.0, green: 133.0 / 255.0, blue: 133.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var brightCyan: UIColor {
        return UIColor(red: 75.0 / 255.0, green: 224.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    @nonobjc class var kermitGreen: UIColor {
        return UIColor(red: 103.0 / 255.0, green: 181.0 / 255.0, blue: 0.0, alpha: 1.0)
    }
    @nonobjc class var kermitGreen54: UIColor {
        return UIColor(red: 103.0 / 255.0, green: 181.0 / 255.0, blue: 0.0, alpha: 0.54)
    }
    @nonobjc class var lightGold: UIColor {
        return UIColor(red: 254.0 / 255.0, green: 225.0 / 255.0, blue: 73.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var pumpkin: UIColor {
        return UIColor(red: 232.0 / 255.0, green: 139.0 / 255.0, blue: 0.0, alpha: 1.0)
    }
    @nonobjc class var sunYellow29: UIColor {
        return UIColor(red: 1.0, green: 222.0 / 255.0, blue: 50.0 / 255.0, alpha: 0.29)
    }
    @nonobjc class var black810: UIColor {
        return UIColor(white: 0.0, alpha: 0.1)
    }
    @nonobjc class var squash: UIColor {
        return UIColor(red: 238.0 / 255.0, green: 162.0 / 255.0, blue: 19.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var aqua: UIColor {
        return UIColor(red: 10.0 / 255.0, green: 231.0 / 255.0, blue: 190.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var sky: UIColor {
        return UIColor(red: 128.0 / 255.0, green: 220.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    @nonobjc class var brightTeal: UIColor {
        return UIColor(red: 0.0, green: 249.0 / 255.0, blue: 215.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var limeYellow: UIColor {
        return UIColor(red: 227.0 / 255.0, green: 1.0, blue: 29.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var lightPink: UIColor {
        return UIColor(red: 1.0, green: 242.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    }
    
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
}
