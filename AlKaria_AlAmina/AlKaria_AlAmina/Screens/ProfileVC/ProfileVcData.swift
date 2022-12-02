//
//  ProfileVcData.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 24/11/2022.
//

import Foundation
import UIKit

extension ProfileVC {
    
    func updateProfile(newModel: EditProfileModel) {
        if let token = AccountManager.shared.token {
            showLoader()
            Authentication.shared.editProfile(newModel: newModel, api_token: token) { [weak self] res in
                guard let StrongSelf = self else {return}
                StrongSelf.hideLoader()
                if let data = res.data, res.result == true {
                    StrongSelf.showSuccessAlert(for: "Success") {
                        AccountManager.shared.profile = data
                        StrongSelf.back()
                    }
                } else {
                    StrongSelf.showAlert(for: res.message ?? "")
                }
            }
        }
        }
        
    
}
