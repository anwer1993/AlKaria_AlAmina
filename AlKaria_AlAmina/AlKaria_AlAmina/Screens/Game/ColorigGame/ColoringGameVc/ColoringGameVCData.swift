//
//  ColoringGameVCData.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 27/11/2022.
//

import Foundation
import UIKit

extension ColoringGameVc {
    
    func saveImage(picture: Data?) {
        if let token = AccountManager.shared.token {
            showLoader()
            GameService.shared.saveImage(api_token: token, picture: picture) { [weak self] resp in
                guard let StrongSelf = self else {
                    return
                }
                StrongSelf.hideLoader()
                if resp.result == true {
                    StrongSelf.showSuccessAlert(for: "تم الإرسال بنجاح")
                } else {
                    StrongSelf.showAlert(for: resp.message ?? "")
                }
            }
        }
        
    }
    
}
