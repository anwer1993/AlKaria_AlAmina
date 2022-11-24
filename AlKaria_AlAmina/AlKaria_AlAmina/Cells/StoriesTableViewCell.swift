//
//  StoriesTableViewCell.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 08/11/2022.
//

import UIKit
import Kingfisher

class StoriesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var storiesTitle: UILabel!
    @IBOutlet weak var storiesImage: UIImageView!
    @IBOutlet weak var storieImageView: UIView!
    @IBOutlet weak var openBtn: UIButton!
    
    var delegate: LireStoryDelegate?
    var storieModel: StorieModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        storieImageView.layer.cornerRadius  = 15
        storiesImage.layer.cornerRadius = 15
        openBtn.layer.cornerRadius = 15
        openBtn.layer.backgroundColor = UIColor.warmPink.cgColor
        openBtn.applySketchShadow(color: .red20, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
        storiesTitle.textColor = .pumpkin
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(model: StorieModel) {
        storieModel = model
        if let picture = model.picture{
            let url = URL(string: "\(Utilities.baseUrl)\(picture)")
            storiesImage.kf.setImage(with: url)
            storiesImage.contentMode = .scaleAspectFill
        }
        storiesTitle.text = model.name ?? ""
    }
    
    
    @IBAction func lireBtnDidTapped(_ sender: UIButton) {
        if let storieModel = storieModel {
            delegate?.lireStory(story: storieModel)
        }
    }
    
}
