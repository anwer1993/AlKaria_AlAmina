//
//  ContactUsVcData.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 17/11/2022.
//

import Foundation
import  UIKit

extension ContactUsVc {
    
    func sendFeedback(response_1: String, response_2: String, response_3: String) {
        if let token = AccountManager.shared.token {
            showLoader()
            Authentication.shared.sendFeedback(api_token: token, response_1: response_1, response_2: response_2, response_3: response_3) {[weak self] resp in
                guard let strongSelf = self else {return}
                if resp.result == true{
                    strongSelf.showSuccessAlert(for: "تم الإرسال بنجاح")
                } else {
                    strongSelf.showAlert(for: resp.message ?? "")
                }
            }
        }
    }
}
