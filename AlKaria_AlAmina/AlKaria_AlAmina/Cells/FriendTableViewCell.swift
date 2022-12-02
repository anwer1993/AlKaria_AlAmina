//
//  FriendTableViewCell.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 08/11/2022.
//

import UIKit
import Kingfisher

class FriendTableViewCell: UITableViewCell {

    
    @IBOutlet weak var avatarLbl: UILabel!
    @IBOutlet weak var viewFriendImage: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var leftArrow: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.backgroundColor = UIColor.white.cgColor
        containerView.layer.cornerRadius  =  20
        containerView.applySketchShadow(color: .black8, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
        viewFriendImage.layer.cornerRadius = viewFriendImage.frame.width * 0.5
        viewFriendImage.layer.borderColor = UIColor.lightGold.cgColor
        viewFriendImage.layer.borderWidth = 2
        friendImage.layer.cornerRadius = friendImage.frame.width * 0.5
        friendName.font = UIFont(name: "NotoSansArabic-Bold", size: 18)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: FriendModel) {
        friendName.text = model.name ?? ""
        if let picture = model.picture{
            let url = URL(string: "\(Utilities.baseUrl)\(picture)")
            friendImage.kf.setImage(with: url)
            friendImage.contentMode = .scaleAspectFill
            avatarLbl.isHidden = true
            friendImage.isHidden = false
        } else {
            friendImage.isHidden = true
            avatarLbl.isHidden = false
            if let avatar = model.name?.first {
                avatarLbl.text = "\(avatar)"
            }
            viewFriendImage.layer.backgroundColor = UIColor.squash.cgColor
        }
    }

}
