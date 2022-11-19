//
//  ResetForgotPasswordVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 02/11/2022.
//

import UIKit

class ResetForgotPasswordVc: UIViewController, Storyboarded {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var stepThreelbl: UILabel!
    @IBOutlet weak var viewStepThree: UIView!
    @IBOutlet weak var stepTwoLbl: UILabel!
    @IBOutlet weak var viewStepTwo: UIView!
    @IBOutlet weak var stepOneLbl: UILabel!
    @IBOutlet weak var viewStepOne: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var sendBtn: GradientButton!
    @IBOutlet weak var showPasswordImage: UIImageView!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var showConfirmPasswordImage: UIImageView!
    @IBOutlet weak var confirmPasswordTxtField: UITextField!
    @IBOutlet weak var confirmPasswordLbl: UILabel!
    @IBOutlet weak var viewConfirmPassword: UIView!
    
    var showpPassword: Bool = false
    var showConfirmPassword: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleShowPassword() {
        showpPassword.toggle()
        passwordTxtField.isSecureTextEntry = !showpPassword
    }
    
    @objc func handleShowConfirmPassword() {
        showConfirmPassword.toggle()
        confirmPasswordTxtField.isSecureTextEntry = !showConfirmPassword
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func enableNextSteps(view: UIView) {
        view.layer.backgroundColor = UIColor.appleGreen.cgColor
    }
    
    func initView() {
        viewContainer.gradientColor(startColor: .offWhite, endColor: .whiteTwo)
        sendBtn.gradientbutton(shadowColor: .red20, startColor: .warmPink, endColor: .pinkRed)
        backView.layer.cornerRadius = 15.0
        backView.horizontalGradeint(startColor: .warmPink, endColor: .pinkRed)
        backView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        viewStepOne.layer.backgroundColor = UIColor.appleGreen.cgColor
        viewPassword.customizeView()
        viewConfirmPassword.customizeView()
        viewStepOne.layer.cornerRadius = viewStepOne.frame.width * 0.5
        viewStepTwo.layer.cornerRadius = viewStepTwo.frame.width * 0.5
        viewStepThree.layer.cornerRadius = viewStepThree.frame.width * 0.5
        enableNextSteps(view: viewStepTwo)
        enableNextSteps(view: viewStepThree)
        enableNextSteps(view: viewStepOne)
        backView.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(back)))
        passwordLbl.isHidden = true
        passwordLbl.textColor = .azure
        confirmPasswordLbl.isHidden = true
        confirmPasswordLbl.textColor = .azure
        passwordTxtField.isSecureTextEntry = true
        confirmPasswordTxtField.isSecureTextEntry = true
        passwordTxtField.delegate = self
        confirmPasswordTxtField.delegate = self
        showPasswordImage.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(handleShowPassword)))
        showConfirmPasswordImage.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(handleShowConfirmPassword)))
    }
    
    
    @IBAction func sendBtnDidTapped(_ sender: Any) {
        do {
            let password = try passwordTxtField.validatedText(validationType: .shortPassword)
            _ = try confirmPasswordTxtField.validatedConfirmPassword(validationType: .confirmPassword, newValue: password)
        } catch (let error) {
            if let error = error as? ValidationnError {
                switch error {
                case .shortPasswordError:
                    showAlert(for: "يجب أن تحتوي كلمة المرور على أكثر من 8 أحرف")
                    break
                case .confirmPasswordError:
                    showAlert(for: "كلمة المرور غير مطابقه ")
                    break
                default:
                    break
                }
            }
        }
    }
    
}


extension ResetForgotPasswordVc: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        validateTextField(textField)
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
        if textField == passwordTxtField {
            passwordLbl.isHidden  = false
            passwordLbl.textColor = .azure
            viewPassword.customizeView()
        } else {
            confirmPasswordLbl.textColor = .azure
            viewConfirmPassword.customizeView()
            confirmPasswordLbl.isHidden  = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        validateTextField(textField)
        print("TextField did end editing method called")
    }
    
    func validateTextField(_ textField: UITextField) {
        if textField == passwordTxtField {
            if textField.text?.count ?? 0 > 0 {
                viewPassword.customizeViewWhenValidField()
            } else {
                viewPassword.customizeViewWhenInvalidField()
                passwordLbl.textColor = .red
            }
        } else {
            if textField.text?.count ?? 0 > 0 {
                viewConfirmPassword.customizeViewWhenValidField()
            } else {
                viewConfirmPassword.customizeViewWhenInvalidField()
                confirmPasswordLbl.textColor = .red
            }
        }
    }
    
}
