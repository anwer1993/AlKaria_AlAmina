//
//  ColoringGameHistoryVcData.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 27/11/2022.
//

import Foundation
import UIKit

extension ColoringGameHistoryVc {
    
    func getHistorique(game_id: Int) {
        if let token = AccountManager.shared.token {
            showLoader()
            GameService.shared.getImageHistory(api_token: token, game_id: 1) { [weak self] resp in
                guard let StrongSelf = self else {
                    return
                }
                StrongSelf.hideLoader()
                if let data = resp.data, resp.result == true {
                    StrongSelf.imageHistories = data
                    StrongSelf.imageCollectionView.reloadData()
                } else {
                    StrongSelf.showAlert(for: resp.message ?? "")
                }
            }
        }
    }
    
}
