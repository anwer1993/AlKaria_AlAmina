//
//  ColoringGameCollectionViewCell.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 21/11/2022.
//

import UIKit

class ColoringGameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var historiqueImage: UIImageView!
    @IBOutlet weak var historiqueView: UIView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gameIcon: UIImageView!
    @IBOutlet weak var gameViewContainer: UIView!
    
    func setupCell(model: GameMenuModel) {
        historiqueView.layer.cornerRadius = 8
        historiqueImage.layer.cornerRadius = 8
        gameViewContainer.layer.cornerRadius = 15.0
        gameIcon.layer.cornerRadius = 15.0
        gameIcon.image = UIImage(named: model.image_name)
        gameName.text = model.title
    }
    
}
