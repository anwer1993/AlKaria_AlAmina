//
//  GameMenuTableViewCell.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 08/11/2022.
//

import UIKit

class GameMenuTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var menuIcon: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avatarLbl: UILabel!
    
    var delegate: PlayGameDelegate?
    var index: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        playBtn.layer.cornerRadius = 15
        playBtn.layer.backgroundColor = UIColor.warmPink.cgColor
        playBtn.applySketchShadow(color: .red20, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
        menuIcon.applySketchShadow(color: .black810, alpha: 1, x: 0, y: 3, blur: 9, spread: 0)
        containerView.layer.backgroundColor = UIColor.white.withAlphaComponent(0.44).cgColor
        containerView.layer.cornerRadius  = 20.0
        containerView.applySketchShadow(color: .black8, alpha: 1, x: 0, y: 3, blur: 30, spread: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(model: GameMenuModel) {
        menuIcon.image = UIImage(named: model.image_name)
        titleLbl.text = model.title
    }
    
    
    @IBAction func playBtnDidTapped(_ sender: Any) {
        delegate?.play(index: self.index)
    }
    
}
