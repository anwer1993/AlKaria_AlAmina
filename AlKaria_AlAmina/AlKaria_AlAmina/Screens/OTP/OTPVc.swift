//
//  OTPVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 02/11/2022.
//

import UIKit
import OTPFieldView

class OTPVc: UIViewController, Storyboarded {
    
    
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
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var otpFieldView: OTPFieldView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var fourthOtpTxt: UITextField!
    @IBOutlet weak var fourthOtpView: UIView!
    @IBOutlet weak var thirdOtpTxt: UITextField!
    @IBOutlet weak var thirdOtpView: UIView!
    @IBOutlet weak var secondOtpTxt: UITextField!
    @IBOutlet weak var secondOtpView: UIView!
    @IBOutlet weak var firstOtpTxt: UITextField!
    @IBOutlet weak var firstOtpView: UIView!
    @IBOutlet weak var otpStackView: UIStackView!
    
    
    
    var code: String?
    var isDeleteAction: Bool = false
    var phoneNumber: String = "9975647345"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    func disableNextSteps(view: UIView, label: UILabel) {
        view.alpha = 0.7
        label.alpha = 0.7
        label.textColor = .brownishGrey
    }
    
    func setupOtpView(view: UIView) {
        view.layer.cornerRadius = 20.0
        view.layer.backgroundColor = UIColor.white.cgColor
        view.applySketchShadow(color: .black8, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
    }
    
    func validateOtpView(view: UIView) {
        view.layer.backgroundColor = UIColor.brightSkyBlue.cgColor
        view.applySketchShadow(color: .brightSkyBlue18, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
    }
    
    func setupTextField(textField: UITextField) {
//        textField.tintColor = .clear
        textField.textColor  = .white
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func enableNextSteps(view: UIView) {
        view.layer.backgroundColor = UIColor.appleGreen.cgColor
    }
    
    func initView() {
        phoneLbl.text = phoneNumber
        viewContainer.gradientColor(startColor: .offWhite, endColor: .whiteTwo)
        sendBtn.gradientbutton(shadowColor: .red20, startColor: .warmPink, endColor: .pinkRed)
        backView.layer.cornerRadius = 15.0
        backView.horizontalGradeint(startColor: .warmPink, endColor: .pinkRed)
        backView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        viewStepOne.layer.backgroundColor = UIColor.appleGreen.cgColor
        viewStepOne.layer.cornerRadius = viewStepOne.frame.width * 0.5
        viewStepTwo.layer.cornerRadius = viewStepTwo.frame.width * 0.5
        viewStepThree.layer.cornerRadius = viewStepThree.frame.width * 0.5
        enableNextSteps(view: viewStepTwo)
        disableNextSteps(view: viewStepThree, label: stepThreelbl)
        enableNextSteps(view: viewStepOne)
        backView.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(back)))
        backgroundView.applySketchShadow(color: .black8, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
        backgroundView.layer.backgroundColor = UIColor.clear.cgColor
        setupOtpView(view: firstOtpView)
        setupOtpView(view: secondOtpView)
        setupOtpView(view: thirdOtpView)
        setupOtpView(view: fourthOtpView)
        firstOtpTxt.delegate = self
        setupTextField(textField: firstOtpTxt)
        secondOtpTxt.delegate = self
        setupTextField(textField: secondOtpTxt)
        thirdOtpTxt.delegate = self
        setupTextField(textField: thirdOtpTxt)
        fourthOtpTxt.delegate = self
        setupTextField(textField: fourthOtpTxt)
        firstOtpTxt.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        secondOtpTxt.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        thirdOtpTxt.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        fourthOtpTxt.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if text?.utf16.count ?? 0 >= 1{
            switch textField{
            case firstOtpTxt:
                validateOtpView(view: firstOtpView)
                secondOtpTxt.becomeFirstResponder()
            case secondOtpTxt:
                validateOtpView(view: secondOtpView)
                thirdOtpTxt.becomeFirstResponder()
            case thirdOtpTxt:
                validateOtpView(view: thirdOtpView)
                fourthOtpTxt.becomeFirstResponder()
            case fourthOtpTxt:
                validateOtpView(view: fourthOtpView)
                fourthOtpTxt.resignFirstResponder()
            default:
                break
            }
        }else{
            switch textField{
            case fourthOtpTxt:
                setupOtpView(view: fourthOtpView)
                thirdOtpTxt.becomeFirstResponder()
            case thirdOtpTxt:
                setupOtpView(view: thirdOtpView)
                secondOtpTxt.becomeFirstResponder()
            case secondOtpTxt:
                setupOtpView(view: secondOtpView)
                firstOtpTxt.becomeFirstResponder()
            case firstOtpTxt:
                setupOtpView(view: firstOtpView)
                firstOtpTxt.becomeFirstResponder()
            default:
                break
            }
        }
    }
    
    func initOtpFieldView() {
        self.otpFieldView.layer.backgroundColor = UIColor.clear.cgColor
        self.otpFieldView.fieldsCount = 4
        self.otpFieldView.displayType = .circular
        self.otpFieldView.defaultBorderColor = .white
        self.otpFieldView.defaultBackgroundColor = .white
        self.otpFieldView.filledBackgroundColor = .white
        self.otpFieldView.fieldBorderWidth = 1
        self.otpFieldView.filledBorderColor = UIColor.white
        self.otpFieldView.cursorColor = UIColor.white
        self.otpFieldView.displayType = .roundedCorner
        self.otpFieldView.separatorSpace = 20
        self.otpFieldView.shouldAllowIntermediateEditing = false
        //        self.otpFieldView.delegate = self
        self.otpFieldView.initializeUI()
    }
    
    @IBAction func sendBtnDidTapped(_ sender: Any) {
        isDeleteAction = false
        if let code = code, code.count == 4 {
            Router.shared.push(with: self.navigationController, screen: .ResetForgotPassword, animated: true)
        } else {
            showAlert(for: "الرمز غير مطابق")
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension OTPVc: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        code = "\(firstOtpTxt.text ?? "")\(secondOtpTxt.text ?? "")\(thirdOtpTxt.text ?? "")\(fourthOtpTxt.text ?? "")"
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        if newString.count > maxLength {
            if textField == firstOtpTxt {
                let lastInd =  newString.trimmingCharacters(in: .whitespaces).index(newString.endIndex, offsetBy: -1)
                secondOtpTxt.text = String(newString[lastInd...])
                secondOtpTxt.becomeFirstResponder()
                validateOtpView(view: secondOtpView)
            } else  if textField == secondOtpTxt {
                let lastInd =  newString.trimmingCharacters(in: .whitespaces).index(newString.endIndex, offsetBy: -1)
                thirdOtpTxt.text = String(newString[lastInd...])
                validateOtpView(view: thirdOtpView)
                thirdOtpTxt.becomeFirstResponder()
            } else if textField  ==  thirdOtpTxt {
                let lastInd =  newString.trimmingCharacters(in: .whitespaces).index(newString.endIndex, offsetBy: -1)
                fourthOtpTxt.text = String(newString[lastInd...])
                validateOtpView(view: fourthOtpView)
                textField.resignFirstResponder()
                isDeleteAction = false
            } else {
                return false
            }
            return false
        } else {
            if newString.count  < currentString.length {
                isDeleteAction = true
            }
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == firstOtpTxt {
            if textField.text?.count  ?? 0 >= 1 {
                validateOtpView(view: firstOtpView)
            }
        } else  if textField == secondOtpTxt {
            if textField.text?.count  ?? 0 >= 1 {
                validateOtpView(view: secondOtpView)
            }
        } else if textField  ==  thirdOtpTxt {
            if textField.text?.count  ?? 0 >= 1 {
                validateOtpView(view: thirdOtpView)
            }
        } else {
            if textField.text?.count  ?? 0 >= 1 {
                validateOtpView(view: fourthOtpView)
            }
        }
        code = "\(firstOtpTxt.text ?? "")\(secondOtpTxt.text ?? "")\(thirdOtpTxt.text ?? "")\(fourthOtpTxt.text ?? "")"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if isDeleteAction {
            textField.becomeFirstResponder()
        } else if firstOtpTxt.text?.count ??  0 < 1 {
            isDeleteAction = false
            firstOtpTxt.becomeFirstResponder()
        } else {
            if secondOtpTxt.text?.count ??  0 < 1 {
                secondOtpTxt.becomeFirstResponder()
            } else {
                if thirdOtpTxt.text?.count ??  0 < 1 {
                    thirdOtpTxt.becomeFirstResponder()
                } else {
                    if fourthOtpTxt.text?.count ??  0 < 1 {
                        fourthOtpTxt.becomeFirstResponder()
                    }
                }
            }
        }
    }
    
}
