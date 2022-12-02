//
//  GameCollectionViewCell.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 16/11/2022.
//

import UIKit
import Kingfisher

class GameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var gameImage: UIImageView!
    
    func setupCell(image: String, fromHistoryScreen: Bool = false) {
        imageViewContainer.layer.cornerRadius = 10
        gameImage.layer.cornerRadius = 10
        if fromHistoryScreen {
            let url = URL(string: "\(Utilities.baseUrl)\(image)")
            gameImage.kf.setImage(with: url)
            gameImage.contentMode = .scaleAspectFill
        } else {
            gameImage.image = UIImage(named: image)
        }
        
    }
    
}
