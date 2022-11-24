//
//  UITextFieldExtension.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 02/11/2022.
//

import Foundation
import UIKit

extension UITextField {
    
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!, newValue: nil)
    }
    
    func validatedConfirmPassword(validationType: ValidatorType, newValue: String) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!, newValue: newValue)
    }
    
}
