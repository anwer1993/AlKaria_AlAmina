//
//  FriendVcData.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 09/11/2022.
//

import Foundation
import  UIKit

extension FriendsVc {
    
    
    func getFriends() {
        if let token = AccountManager.shared.token {
            showLoader()
            ContactService.shared.friendsList(api_token: token) {[weak self] response in
                guard let StrongSelf  = self else {return}
                StrongSelf.hideLoader()
                if let data = response.data, response.result == true {
                    StrongSelf.friends = data
                    StrongSelf.friendsTableView.reloadData()
                } else {
                    StrongSelf.showAlert(for: response.message  ?? "")
                }
            }
        }
        
        
    }
}
