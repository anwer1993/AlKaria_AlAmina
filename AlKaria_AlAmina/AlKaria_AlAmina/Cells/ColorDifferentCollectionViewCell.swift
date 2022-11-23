//
//  ColorDifferentCollectionViewCell.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 23/11/2022.
//

import UIKit

class ColorDifferentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    func setupCell(color: UIColor, index: Int) {
        containerView.layer.cornerRadius = 5
        containerView.layer.backgroundColor = color.cgColor
        
    }
    
}
