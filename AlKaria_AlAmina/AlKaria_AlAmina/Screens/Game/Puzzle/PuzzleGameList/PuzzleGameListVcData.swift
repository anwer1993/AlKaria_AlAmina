//
//  PuzzleGameListVcData.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 17/11/2022.
//

import Foundation
import UIKit

extension PuzzleGameListVc {
    
    
    func getScore(game_id: Int) {
        if let token = AccountManager.shared.token {
            showLoader()
            GameService.shared.topScore(api_token: token, game_id: game_id) {[weak self] res in
                guard let strongSelf = self else {return}
                strongSelf.hideLoader()
                if let data = res.data, res.result  == true{
                    strongSelf.addChildVc(strongSelf.standingVc) {
                    }
                    strongSelf.standingVc.topScore = data
                } else {
                    strongSelf.showAlert(for: "")
                }
            }
        }
        
    }
    
}
