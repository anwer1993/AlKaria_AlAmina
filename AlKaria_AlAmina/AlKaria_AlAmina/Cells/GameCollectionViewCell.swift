//
//  GameCollectionViewCell.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 16/11/2022.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var gameImage: UIImageView!
    
    func setupCell(image: String) {
        imageViewContainer.layer.cornerRadius = 10
        gameImage.layer.cornerRadius = 10
        gameImage.image = UIImage(named: image)
    }
    
}
