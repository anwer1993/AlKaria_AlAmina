//
//  UImageViewExtesion.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 08/11/2022.
//

import Foundation
import UIKit

extension UIImageView {
    
    func imageTintColor(image: String, color: UIColor) {
        self.image = UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    func resetImageTintColor(image: String) {
        self.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
    }
}
