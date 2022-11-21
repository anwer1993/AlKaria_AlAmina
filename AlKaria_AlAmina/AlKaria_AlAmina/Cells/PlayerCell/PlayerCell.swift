//
//  PlayerCell.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 17/11/2022.
//

import Foundation
import UIKit

class PlayerCell: UITableViewCell {
    
    @IBOutlet weak var rankingLbl: UILabel!
    @IBOutlet weak var avatarLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var playerNameLbl: UILabel!
    
    func setupCell(scoreModel: ScoreModel, index: Int) {
        rankingLbl.text = ".\(index + 1)"
        if let avatar = scoreModel.user?.name?.first {
            avatarLbl.text = "\(avatar)"
        }
        playerNameLbl.text = scoreModel.user?.name ?? ""
        scoreLbl.text = "الرقم المتحصل عليه : \(scoreModel.score ?? "")"
    }
    
}
