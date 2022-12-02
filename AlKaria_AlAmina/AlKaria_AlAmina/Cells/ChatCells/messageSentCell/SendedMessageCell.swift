//
//  SendedMessageCell.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 27/11/2022.
//

import UIKit

class SendedMessageCell: UITableViewCell {

    
    @IBOutlet weak var viewContainerMessage: UIView!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var senderImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        senderImage.layer.cornerRadius = senderImage.frame.width * 0.5
        viewContainerMessage.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(message: MessageModel) {
        messageLbl.text = message.message ?? ""
        if let image = message.from?.picture {
            let url = URL(string: "\(Utilities.baseUrl)\(image)")
            senderImage.kf.setImage(with: url)
            senderImage.contentMode = .scaleAspectFill
        }
        dateLbl.text = message.date
        
    }

}
