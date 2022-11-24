//
//  Validators.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 02/11/2022.
//

import Foundation

class ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

enum ValidationnError: Error {
    case usernameError
    case fullNameError
    case passwordError
    case shortPasswordError
    case confirmPasswordError
    case phoneNumberError
    case countryError
    case cityError
}

protocol ValidatorConvertible {
    func validated(_ value: String, newValue: String?) throws -> String
}

enum ValidatorType {
    case username
    case fullName
    case emptyPassword
    case shortPassword
    case confirmPassword
    case phoneNumber
    case country
    case city
}

enum ValidatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .username: return UserNameValidator()
        case .fullName: return FullNameValidator()
        case .emptyPassword: return PasswordValidator()
        case .shortPassword: return ShortPasswordValidator()
        case .confirmPassword: return ConfirmPasswordValidator()
        case .phoneNumber: return PhoneNumberValidator()
        case .country: return CountryValidator()
        case .city: return CityValidator()
        }
    }
}

struct FullNameValidator: ValidatorConvertible {
    func validated(_ value: String, newValue: String? = nil) throws -> String {
        guard value.count >= 2 else {
            throw ValidationnError.fullNameError
        }
        return value
    }
}

struct UserNameValidator: ValidatorConvertible {
    func validated(_ value: String, newValue: String? = nil) throws -> String {
        guard value.count >= 2 else {
            throw ValidationnError.usernameError
        }
        return value
    }
}

struct CountryValidator: ValidatorConvertible {
    func validated(_ value: String, newValue: String? = nil) throws -> String {
        guard value.count >= 2 else {
            throw ValidationnError.countryError
        }
        return value
    }
}

struct CityValidator: ValidatorConvertible {
    func validated(_ value: String, newValue: String? = nil) throws -> String {
        guard value.count >= 2 else {
            throw ValidationnError.cityError
        }
        return value
    }
}

struct PhoneNumberValidator: ValidatorConvertible {
    func validated(_ value: String, newValue: String? = nil) throws -> String {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        do {
            if try NSRegularExpression(pattern: PHONE_REGEX,  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationnError.phoneNumberError
            }
        } catch {
            throw ValidationnError.phoneNumberError
        }
        return value
    }
}

struct PasswordValidator: ValidatorConvertible {
    func validated(_ value: String, newValue: String? = nil) throws -> String {
        guard value != "" else {throw ValidationnError.passwordError}
        return value
    }
}

struct ShortPasswordValidator: ValidatorConvertible {
    func validated(_ value: String, newValue: String? = nil) throws -> String {
        guard value.count >= 8 else { throw ValidationnError.shortPasswordError}
        return value
    }
}

struct ConfirmPasswordValidator: ValidatorConvertible {
    func validated(_ value: String, newValue: String? = nil) throws -> String {
        guard value == newValue else { throw ValidationnError.confirmPasswordError}
        return value
    }
}







