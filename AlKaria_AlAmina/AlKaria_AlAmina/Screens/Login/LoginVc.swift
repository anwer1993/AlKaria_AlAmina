//
//  LoginVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 01/11/2022.
//

import Foundation
import  UIKit

class LoginVc: UIViewController, Storyboarded{
    
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var loginBtn: GradientButton!
    @IBOutlet weak var dontHaveAccountLbl: UILabel!
    @IBOutlet weak var screenTitleLbl: UILabel!
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var showPasswordImage: UIImageView!
    @IBOutlet weak var passwordErrorLbl: UILabel!
    @IBOutlet weak var usernameErrorLbl: UILabel!
    @IBOutlet weak var forgotPasswordLbl: UILabel!
    
    
    var showpPassword: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @objc func handleShowPassword() {
        showpPassword.toggle()
        passwordTxtField.isSecureTextEntry = !showpPassword
    }
    
    @objc func handleForgotPassword() {
        Router.shared.push(with: self.navigationController, screen: .ForgotPassword, animated: true)
    }
    
    @objc func showRegister() {
        Router.shared.push(with: self.navigationController, screen: .Register, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func initView() {
        viewContainer.gradientColor(startColor: .offWhite, endColor: .whiteTwo)
        loginBtn.gradientbutton(shadowColor: .red20, startColor: .warmPink, endColor: .pinkRed)
        loginBtn.applySketchShadow(color: .red20, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
        usernameView.customizeView()
        passwordView.customizeView()
        usernameErrorLbl.isHidden = true
        passwordErrorLbl.isHidden = true
        usernameLbl.isHidden = true
        usernameErrorLbl.textColor = .red
        passwordErrorLbl.textColor = .red
        passwordLbl.isHidden = true
        dontHaveAccountLbl.attributedText = dontHaveAccountLbl.customizeTextLabel(stringToColor: "انشاء حساب جديد", color: .azure)
        passwordTxtField.isSecureTextEntry = true
        passwordTxtField.delegate = self
        usernameTxtField.delegate = self
        showPasswordImage.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(handleShowPassword)))
        dontHaveAccountLbl.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(showRegister)))
    }
    
    func validateUsername() {
        if usernameTxtField.text?.isEmpty == false {
            usernameLbl.isHidden = false
            usernameLbl.textColor = .azure
            usernameErrorLbl.isHidden = true
            usernameView.customizeViewWhenValidField()
        }
    }
    
    func validatepPassword() {
        if passwordTxtField.text?.isEmpty == false {
            passwordLbl.isHidden = false
            passwordLbl.textColor = .azure
            passwordErrorLbl.isHidden = true
            passwordView.customizeViewWhenValidField()
        }
    }
    
    @IBAction func loginBtnDidTapped(_ sender: Any) {
        login(username: "username", password: "password")

//        do {
//            let username = try usernameTxtField.validatedText(validationType: .username)
//            let password = try passwordTxtField.validatedText(validationType: .emptyPassword)
//            validatepPassword()
//            validateUsername()
//            login(username: username, password: password)
//        } catch (let error) {
//            if let error = error as? ValidationnError {
//                switch error {
//                case .usernameError:
//                    invalidUsername()
//                    break
//                case .passwordError:
//                    invalidPassword()
//                    break
//                default:
//                    break
//                }
//            }
//        }
    }
    
    
}


extension LoginVc: UITextFieldDelegate {
    
    func invalidUsername() {
        validatepPassword()
        usernameErrorLbl.isHidden = false
        usernameErrorLbl.text = "يجب أن يحتوي اسم المستخدم على أكثر من حرفين"
        usernameLbl.customizeLabelWhenError()
        usernameView.customizeViewWhenInvalidField()
    }
    
    func invalidPassword() {
        validateUsername()
        passwordErrorLbl.isHidden = false
        passwordErrorLbl.text  = "كلمة المرور مطلوبة"
        passwordLbl.customizeLabelWhenError()
        passwordView.customizeViewWhenInvalidField()
    }
    
    func validateTextFieldWhenEndEditing(_ textField: UITextField) {
        if textField == usernameTxtField {
            do {
                _ = try usernameTxtField.validatedText(validationType: .username)
                validateUsername()
            } catch (let error) {
                if let error = error as? ValidationnError {
                    switch error {
                    case .usernameError:
                        invalidUsername()
                        break
                    default:
                        break
                    }
                }
            }
        } else {
            do {
                _ = try passwordTxtField.validatedText(validationType: .emptyPassword)
                validatepPassword()
            } catch (let error) {
                if let error = error as? ValidationnError {
                    switch error {
                    case .passwordError:
                        invalidPassword()
                        break
                    default:
                        break
                    }
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        validateTextFieldWhenEndEditing(textField)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
        if textField == usernameTxtField {
            usernameErrorLbl.isHidden = true
            usernameLbl.customizeLabelWhenValid()
            usernameView.customizeView()
        } else {
            passwordLbl.customizeLabelWhenValid()
            passwordErrorLbl.isHidden = true
            passwordView.customizeView()
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called")
        validateTextFieldWhenEndEditing(textField)
    }
    
    
}
