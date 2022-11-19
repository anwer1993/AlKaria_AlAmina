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
        ContactService.shared.friendsList(api_token: "MjUyNDAxNjY4MTExMTMzMTAz") {[weak self] response in
            guard let StrongSelf  = self else {return}
            if let data = response.data, response.result == true {
                StrongSelf.friends = data
                StrongSelf.friendsTableView.reloadData()
            } else {
                print(response.message)
            }
        }
        
    }
}
