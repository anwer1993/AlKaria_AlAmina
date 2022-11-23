//
//  PuzzleGameVcData.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 18/11/2022.
//

import Foundation
import UIKit

extension PuzzleGameVc {
    
    
    func insertScore() {
        if let token  = AccountManager.shared.token {
            GameService.shared.insertScore(api_token: token, game_id: 0, score: movesCount) { _ in
            }
        }
    }
    
}
