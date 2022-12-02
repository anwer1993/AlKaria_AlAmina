//
//  HomeMenuTableViewCell.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 07/11/2022.
//

import UIKit

class HomeMenuTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var menuDescLbl: UILabel!
    @IBOutlet weak var menuTitleLbl: UILabel!
    @IBOutlet weak var menuIcon: UIImageView!
    @IBOutlet weak var ellipseIcon: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 20.0
        setupLabelFont()
    }
    
    func gradientColor(startColor: UIColor, endColor: UIColor)  {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 134.0)
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.cornerRadius = 20
        containerView.layer.insertSublayer(gradient, at: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupLabelFont() {
        menuTitleLbl.font = UIFont(name: "NotoSansArabic-Bold", size: 20)
        menuDescLbl.font = UIFont(name: "NotoSansArabic-Medium", size: 16)
    }
    
    func setCell(model: MenuModel) {
        menuIcon.layer.cornerRadius = menuIcon.frame.width * 0.5
        menuIcon.image = UIImage(named: model.image_name)
        menuTitleLbl.text = model.title
        menuDescLbl.text = model.message
        if model.title == Utilities.menu[0].title{
            self.gradientColor(startColor: .peachyPink, endColor: .pinkRed)
            containerView.applySketchShadow(color: .pinkRed1020, alpha: 1, x: 0, y: 3, blur: 6, spread: 0)
        }  else if model.title == Utilities.menu[1].title {
            self.gradientColor(startColor: .brightCyan, endColor: .kermitGreen)
            containerView.applySketchShadow(color: .kermitGreen54, alpha: 1, x: 0, y: 3, blur: 6, spread: 0)
        } else {
            self.gradientColor(startColor: .lightGold, endColor: .pumpkin)
            containerView.applySketchShadow(color: .sunYellow29, alpha: 1, x: 0, y: 3, blur: 6, spread: 0)
        }
    }

}
