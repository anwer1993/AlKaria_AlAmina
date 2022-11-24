//
//  LoginVcData.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 15/11/2022.
//

import Foundation
import UIKit

extension LoginVc {
    
    func login(username: String, password: String) {
        Router.shared.push(with: self.navigationController, screen: .Tabbar(selectedIndex: 0), animated: true)
//        Router.shared.present(screen: .ColoringGame, modalePresentatioinStyle: .fullScreen, completion: nil)
//        showLoader()
//        Authentication.shared.login(user_name: username, password: password) {[weak self] response in
//            guard let strogSelf = self  else {return}
//            strogSelf.hideLoader()
//            if let data = response.data, response.result == true, let token = response.api_token {
//                AccountManager.shared.token = token
//                AccountManager.shared.profile = data
//                Router.shared.push(with: strogSelf.navigationController, screen: .Tabbar(selectedIndex: 0), animated: true)
//            } else {
//                strogSelf.showAlert(for: response.message ?? "")
//            }
//        }
    }
    
}
