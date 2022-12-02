//
//  ChatVcData.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 28/11/2022.
//

import Foundation
import UIKit

extension ChatVc {
    
    func sendMessageTo(user_id: Int, message: String) {
        if let token = AccountManager.shared.token {
            ContactService.shared.sendMessage(api_token: token, user_id: user_id, message: message) { [weak self] resp in
                guard let StrongSelf = self else {return}
                if resp.result == true {
                    StrongSelf.textView.text = ""
                    StrongSelf.fetchMessages(with: user_id, isFirstTime: false)
                } else {
                    StrongSelf.showAlert(for: resp.message  ?? "")
                }
            }
        }
    }
    
    func fetchMessages(with user_id: Int, isFirstTime: Bool) {
        if let token = AccountManager.shared.token {
            if isFirstTime {showLoader()}
            ContactService.shared.fetchMessages(api_token: token, user_id: user_id) { [weak self] resp in
                guard let StrongSelf = self else {return}
                if isFirstTime {StrongSelf.hideLoader()}
                if let data = resp.data, resp.result == true {
                    StrongSelf.response = data
                    StrongSelf.messages = (data.data ?? []).reversed()
                    StrongSelf.chatTableView.reloadData()
                } else {
                    StrongSelf.showAlert(for: resp.message  ?? "")
                }
            }
        }
    }
}
