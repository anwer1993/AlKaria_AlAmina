//
//  ColorDifferentVcData.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 23/11/2022.
//

import Foundation
import UIKit

extension ColorDifferentGameVc {
    
    func getBestScore() {
        if let token = AccountManager.shared.token {
            showLoader()
            GameService.shared.topScore(api_token: token, game_id: 2) { [weak self] resp in
                guard let strongSelf = self else {return}
                strongSelf.hideLoader()
                if let data = resp.data, resp.result == true {
//                    let  t = data.first
////                    t.sc
//                    strongSelf.bestScore = Int(data.first(where: {$0.score}))  ?? 0
//                    strongSelf.initView()
                } else {
                    strongSelf.showAlert(for: "Session expired")
                }
            }
        }
    }
    
    func insertScore() {
        if let token = AccountManager.shared.token {
            showLoader()
            GameService.shared.insertScore(api_token: token, game_id: 2, score: score) { [weak self] resp in
                guard let strongSelf = self else {return}
                strongSelf.hideLoader()
                if resp.result == true {
                    // show scoreVc
                }
            }
        }
    }
    
}
