//
//  UILabelExtension.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 02/11/2022.
//

import Foundation
import UIKit

extension UILabel {
    
    func customizeTextLabel(stringToColor: String, color: UIColor, isUnderline: Bool = false) -> NSAttributedString {
        guard let text = self.text else {return NSAttributedString()}
        let range = (text as NSString).range(of: stringToColor)
        let mutableAttributedString = NSMutableAttributedString.init(string: text)
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: font.pointSize)]
        mutableAttributedString.addAttributes(boldFontAttribute, range: range)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        if isUnderline {
            mutableAttributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: range)
        }
        return mutableAttributedString
    }
    
    func customizeLabelWhenError() {
        textColor = .red
        isHidden = false
    }
    
    func customizeLabelWhenValid() {
        textColor = .azure
        isHidden = false
    }
    
    
}
