//
//  RegisterVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 04/11/2022.
//

import UIKit

class RegisterVc: UIViewController, Storyboarded {
    
    
    
    @IBOutlet weak var viewUserImage: UIView!
    @IBOutlet weak var showConfirmPasswordIcon: UIImageView!
    @IBOutlet weak var showPasswordIcon: UIImageView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var avatarIcon: UIImageView!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var fullNameTxt: UITextField!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var fullNameView: UIView!
    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var countryTxt: UITextField!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var maleLbl: UILabel!
    @IBOutlet weak var selectMaleIcon: UIImageView!
    @IBOutlet weak var maleView: UIView!
    @IBOutlet weak var femaleLbl: UILabel!
    @IBOutlet weak var selectFemaleIcon: UIImageView!
    @IBOutlet weak var femaleView: UIView!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var confirmPasswordLbl: UILabel!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var acceptTermsIcon: UIImageView!
    @IBOutlet weak var acceptTermsLbl: UILabel!
    @IBOutlet weak var registerBtn: GradientButton!
    @IBOutlet weak var dontHaveAccountLbl: UILabel!
    
    var selectedCategory: Int = 0
    var showPassword: Bool = true
    var ShowConfirmPassword: Bool = true
    var acceptTerms: Bool = false
    var userImageData: Data?
    
    var gesture: UITapGestureRecognizer {
        return UITapGestureRecognizer(target: self, action: #selector(didTapOnback))
    }
    
    var addPictureGesture: UITapGestureRecognizer  {
        return UITapGestureRecognizer(target: self, action: #selector(showActionSheet(_:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        showPasswordIcon.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(didTapOnShowPassword)))
        showConfirmPasswordIcon.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(didTapOnShowConfirmPassword)))
        acceptTermsIcon.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(didAcceptTerms)))
        acceptTermsLbl.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(showTermsScreen)))
        dontHaveAccountLbl.addTapGesture(gesture)
        backView.addTapGesture(gesture)
        userImage.addTapGesture(addPictureGesture)
        avatarIcon.addTapGesture(addPictureGesture)
        cameraView.addTapGesture(addPictureGesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func didTapOnShowPassword() {
        showPassword.toggle()
        passwordTxt.isSecureTextEntry = showPassword
    }
    
    @objc func didTapOnShowConfirmPassword() {
        ShowConfirmPassword.toggle()
        confirmPasswordTxt.isSecureTextEntry = ShowConfirmPassword
    }
    
    @objc func didAcceptTerms() {
        acceptTerms.toggle()
        acceptTermsIcon.image = UIImage(named: acceptTerms ? "selected_icon":"unselected_icon")
    }
    
    @objc func showTermsScreen() {
        
    }
    
    @objc func didTapOnback() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func initView() {
        viewUserImage.layer.cornerRadius = viewUserImage.frame.width * 0.5
        viewUserImage.applySketchShadow(color: .brightSkyBlue18, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
        viewUserImage.layer.backgroundColor = UIColor.azure.cgColor
        viewContainer.gradientColor(startColor: .offWhite, endColor: .whiteTwo)
        containerView.gradientColor(startColor: .offWhite, endColor: .whiteTwo)
        backView.layer.cornerRadius = 15.0
        backView.horizontalGradeint(startColor: .warmPink, endColor: .pinkRed)
        backView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        userImage.layer.cornerRadius = userImage.frame.width * 0.5
        cameraView.layer.cornerRadius = cameraView.frame.width * 0.5
        registerBtn.gradientbutton(shadowColor: .red20, startColor: .warmPink, endColor: .pinkRed)
        fullNameView.customizeView()
        phoneNumberView.customizeView()
        usernameView.customizeView()
        countryView.customizeView()
        cityView.customizeView()
        passwordView.customizeView()
        confirmPasswordView.customizeView()
        initCategoryView()
        dontHaveAccountLbl.attributedText = dontHaveAccountLbl.customizeTextLabel(stringToColor: "سجل الأن", color: .azure)
        acceptTermsLbl.attributedText = acceptTermsLbl.customizeTextLabel(stringToColor: "شروط الاستخدام", color: .black, isUnderline: true)
        fullNameLbl.isHidden = true
        phoneLbl.isHidden = true
        usernameLbl.isHidden = true
        countryLbl.isHidden = true
        cityLbl.isHidden = true
        passwordLbl.isHidden = true
        confirmPasswordLbl.isHidden = true
        fullNameTxt.delegate = self
        phoneTxt.delegate = self
        phoneTxt.keyboardType = .phonePad
        usernameTxt.delegate = self
        countryTxt.delegate = self
        cityTxt.delegate = self
        passwordTxt.delegate = self
        passwordTxt.isSecureTextEntry = true
        confirmPasswordTxt.delegate = self
        confirmPasswordTxt.isSecureTextEntry = true
    }
    
    func startEditTextField(view: UIView, label: UILabel){
        view.customizeView()
        label.textColor = .azure
        label.isHidden = false
    }
    
    func activateTextField(view: UIView, label: UILabel){
        view.customizeViewWhenValidField()
        label.textColor = .azure
        label.isHidden = false
    }
    
    func deactivateTextField(view: UIView, label: UILabel){
        view.customizeViewWhenInvalidField()
        label.textColor = .red
        label.isHidden = false
    }
    
    func initCategoryView() {
        if selectedCategory == 0 {
            selectCatView(view: maleView)
            deselectCatView(view: femaleView)
        } else {
            selectCatView(view: femaleView)
            deselectCatView(view: maleView)
        }
    }

    func selectCatView(view: UIView) {
        view.layer.cornerRadius = 15.0
        view.layer.backgroundColor = UIColor.orangeyRed18.cgColor
        view.layer.borderColor = UIColor.pinkRed.cgColor
        view.layer.borderWidth = 2
        view.applySketchShadow(color: .orangeyRed18, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
    }
    
    func deselectCatView(view: UIView) {
        view.layer.cornerRadius = 15.0
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 2
        view.applySketchShadow(color: .black8, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
    }
    
    func updateIcon(selectedItem: Int) {
        if selectedItem == 0 {
            selectMaleIcon.image = UIImage(named: "selected_icon")
            selectFemaleIcon.image = UIImage(named: "unselected_icon")
        } else {
            selectMaleIcon.image = UIImage(named: "unselected_icon")
            selectFemaleIcon.image = UIImage(named: "selected_icon")
        }
    }
    
    
    @IBAction func selectCategoryBtnDidTapped(_ sender: Any) {
        if let btn =  sender as?  UIButton  {
            if btn.tag == 0 {
                selectedCategory = 0
                selectCatView(view: maleView)
                deselectCatView(view: femaleView)
                updateIcon(selectedItem: 0)
            } else {
                selectedCategory = 1
                selectCatView(view: femaleView)
                deselectCatView(view: maleView)
                updateIcon(selectedItem: 1)
            }
        }
    }
    
    
    @IBAction func registerBtnDidTapped(_ sender: Any) {
        if acceptTerms {
            do {
                let  fullname = try fullNameTxt.validatedText(validationType: .fullName)
                let phone = try phoneTxt.validatedText(validationType: .phoneNumber)
                let username = try usernameTxt.validatedText(validationType: .username)
                let country = try countryTxt.validatedText(validationType: .country)
                let city = try cityTxt.validatedText(validationType: .city)
                _ = try passwordTxt.validatedText(validationType: .emptyPassword)
                let passowrd = try passwordTxt.validatedText(validationType: .shortPassword)
                _ = try confirmPasswordTxt.validatedConfirmPassword(validationType: .confirmPassword, newValue: passowrd)
            } catch (let error) {
                if let error = error as? ValidationnError {
                    switch error {
                    case .usernameError:
                        deactivateTextField(view: usernameView, label: usernameLbl)
                        showAlert(for: "الرجاء إدخال اسم االمستخدم الخاص بيك")
                        break
                    case .passwordError:
                        deactivateTextField(view: passwordView, label: passwordLbl)
                        showAlert(for: "الرجاء إدخال كلمة المرور الخاص بيك")
                        break
                    case .shortPasswordError:
                        deactivateTextField(view: passwordView, label: passwordLbl)
                        showAlert(for: "يجب أن تحتوي كلمة المرور على أكثر من 8 أحرف")
                        break
                    case .confirmPasswordError:
                        deactivateTextField(view: confirmPasswordView, label: confirmPasswordLbl)
                        showAlert(for: "كلمة المرور غير مطابقة")
                        break
                    case .phoneNumberError:
                        deactivateTextField(view: phoneNumberView, label: phoneLbl)
                        showAlert(for: "الرجاء إدخال رقم الهاتف الخاص بيك")
                        break
                    case .fullNameError:
                        deactivateTextField(view: fullNameView, label: fullNameLbl)
                        showAlert(for: "الرجاء إدخال الإسم الكامل الخاص بيك")
                        break
                    case .countryError:
                        deactivateTextField(view: countryView, label: countryLbl)
                        showAlert(for: "الرجاء إدخال الدولة الخاص بيك")
                        break
                    case .cityError:
                        deactivateTextField(view: cityView, label: cityLbl)
                        showAlert(for: "الرجاء إدخال المدينة الخاص بيك")
                        break
                    }
                }
            }
            
        } else {
            showAlert(for: "الرجاء الموافقه على شروط الاستخدام")
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


extension RegisterVc: UITextFieldDelegate {
    
    func startEditingTextField(_ textField: UITextField) {
        if textField == fullNameTxt {
            startEditTextField(view: fullNameView, label: fullNameLbl)
        } else if textField == phoneTxt {
            startEditTextField(view: phoneNumberView, label: phoneLbl)
        } else if textField == usernameTxt {
            startEditTextField(view: usernameView, label: usernameLbl)
        } else if textField == countryTxt {
            startEditTextField(view: countryView, label: countryLbl)
        } else if textField == cityTxt {
            startEditTextField(view: cityView, label: cityLbl)
        } else if textField == passwordTxt {
            startEditTextField(view: passwordView, label: passwordLbl)
        } else if textField == confirmPasswordTxt {
            startEditTextField(view: confirmPasswordView, label: confirmPasswordLbl)
        }
    }
    
    func validateTextFieldWhenEndEditing(_ textField: UITextField) {
        if textField == fullNameTxt {
            if textField.text?.count ?? 0 > 0 {
                activateTextField(view: fullNameView, label: fullNameLbl)
            } else {
                deactivateTextField(view: fullNameView, label: fullNameLbl)
            }
        } else if textField == phoneTxt {
            if textField.text?.count ?? 0 > 0 {
                activateTextField(view: phoneNumberView, label: phoneLbl)
            } else {
                deactivateTextField(view: phoneNumberView, label: phoneLbl)
            }
        } else if textField == usernameTxt {
            if textField.text?.count ?? 0 > 0 {
                activateTextField(view: usernameView, label: usernameLbl)
            } else {
                deactivateTextField(view: usernameView, label: usernameLbl)
            }
        } else if textField == countryTxt {
            if textField.text?.count ?? 0 > 0 {
                activateTextField(view: countryView, label: countryLbl)
            } else {
                deactivateTextField(view: countryView, label: countryLbl)
            }
        } else if textField == cityTxt {
            if textField.text?.count ?? 0 > 0 {
                activateTextField(view: cityView, label: cityLbl)
            } else {
                deactivateTextField(view: cityView, label: cityLbl)
            }
        } else if textField == passwordTxt {
            if textField.text?.count ?? 0 > 0 {
                activateTextField(view: passwordView, label: passwordLbl)
            } else {
                deactivateTextField(view: passwordView, label: passwordLbl)
            }
        } else if textField == confirmPasswordTxt {
            if textField.text?.count ?? 0 > 0 {
                activateTextField(view: confirmPasswordView, label: confirmPasswordLbl)
            } else {
                deactivateTextField(view: confirmPasswordView, label: confirmPasswordLbl)
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
        startEditingTextField(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called")
        validateTextFieldWhenEndEditing(textField)
    }
    
    
}
