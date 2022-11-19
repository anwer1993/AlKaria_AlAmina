//
//  PartenarCollectionViewCell.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 09/11/2022.
//

import UIKit

class PartenarCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var partenarImage: UIImageView!
    @IBOutlet weak var partenarName: UILabel!
    @IBOutlet weak var imageViewContainer: UIView!
    
    func setupCell(model: PartenarModel) {
        imageViewContainer.layer.cornerRadius = 10
        imageViewContainer.applySketchShadow(color: .black8, alpha: 1, x: 0, y: 3, blur: 6, spread: 0)
        partenarImage.image = UIImage(named: model.image ?? "")
        partenarName.text = model.name ?? ""
    }
    
}
