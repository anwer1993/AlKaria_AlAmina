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
            GameService.shared.topScore(api_token: token, game_id: Game.ColorDifferent.rawValue) { [weak self] resp in
                guard let strongSelf = self else {return}
                strongSelf.hideLoader()
                if let data = resp.data, resp.result == true {
                    let topScore = data.sorted(by: {Int($0.score ?? "") ?? 0 > Int($1.score ?? "") ?? 0})
                    if let bestScore = topScore.first {
                        strongSelf.bestScore = Int(bestScore.score ?? "") ?? 0
                    }
                    strongSelf.initView()
                } else {
                    strongSelf.showAlert(for: "Session expired")
                }
            }
        }
    }
    
    func insertScore() {
        if let token = AccountManager.shared.token {
            showLoader()
            GameService.shared.insertScore(api_token: token, game_id: Game.ColorDifferent.rawValue, score: score) { [weak self] resp in
                guard let strongSelf = self else {return}
                strongSelf.hideLoader()
                if resp.result == true {
                    // show scoreVc
                }
            }
        }
    }
    
}
