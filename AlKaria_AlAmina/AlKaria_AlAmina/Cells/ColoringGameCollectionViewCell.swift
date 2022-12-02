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
    
    var index: Int = 0
    var delegate: ColoringGameProtocol?
    
    func setupCell(model: ColoringGameMenuModel, index: Int) {
        self.index = index
        historiqueView.layer.cornerRadius = 8
        historiqueImage.layer.cornerRadius = 8
        gameViewContainer.layer.cornerRadius = 15.0
        gameIcon.layer.cornerRadius = 15.0
        gameIcon.image = UIImage(named: model.image_name)
        gameName.text = model.title
        gameIcon.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(goToPlay)))
        historiqueView.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(seeHistorique)))
        gameName.font = UIFont(name: "NotoSansArabic-Bold", size: 13)
    }
    
    @objc func goToPlay() {
        delegate?.goToPlay(index: self.index)
    }
    
    @objc func seeHistorique() {
        delegate?.seeHistorique(index: self.index)
    }
    
}
