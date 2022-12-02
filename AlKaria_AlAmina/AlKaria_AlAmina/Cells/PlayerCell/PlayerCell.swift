//
//  PlayerCell.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 17/11/2022.
//

import Foundation
import UIKit

class PlayerCell: UITableViewCell {
    
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var playerAvatarLbl: UILabel!
    @IBOutlet weak var indexLbl: UILabel!
    
    func setupCell(index: Int, score: ScoreModel) {
        indexLbl.text = "\(index)"
        playerName.text = score.user?.name ?? ""
        scoreLbl.text = "الرقم المتحصل عليه : \(score.score ?? "")"
        if let first = score.user?.name?.first {
            playerAvatarLbl.text  = "\(first)"
        }
    }
    
}
