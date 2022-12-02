//
//  ProfileVC.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 13/11/2022.
//

import UIKit
import Kingfisher

class ProfileVC: UIViewController, Storyboarded {
    
    @IBOutlet weak var confirmBtn: GradientButton!
    @IBOutlet weak var acceptTermsIcon: UIImageView!
    @IBOutlet weak var acceptTermsLbl: UILabel!
    @IBOutlet weak var maleSelectedIcon: UIImageView!
    @IBOutlet weak var maleLbl: UILabel!
    @IBOutlet weak var maleView: UIView!
    @IBOutlet weak var femaleSelectedIcon: UIImageView!
    @IBOutlet weak var femaleLbl: UILabel!
    @IBOutlet weak var femaleView: UIView!
    @IBOutlet weak var genderStack: UIStackView!
    @IBOutlet weak var dobTxtField: UITextField!
    @IBOutlet weak var dobLbl: UILabel!
    @IBOutlet weak var dobView: UIView!
    @IBOutlet weak var fullNameTxtField: UITextField!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var viewFullName: UIView!
    @IBOutlet weak var takePicImage: UIImageView!
    @IBOutlet weak var takePicView: UIView!
    @IBOutlet weak var profileAvatar: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileImageView: UIView!
    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var backIcon: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    var profile: ProfileModel?
    var acceptTerms: Bool = false
    var gender: String = "0"
    var profilePic: Data? = nil
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone.current
        return datePicker
    }()
    
    var tapGesture: UITapGestureRecognizer {
        return UITapGestureRecognizer(target: self, action: #selector(showActionSheet(_:)))
    }
    
    var gesture: UITapGestureRecognizer {
        return UITapGestureRecognizer(target: self, action: #selector(didUpdateGender(_:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initProfile(profile: AccountManager.shared.profile)
        setupDobPicker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getProfile(completion: { [weak self] model in
            guard let StrongSelf = self else {return}
            StrongSelf.initProfile(profile: model)
        })
    }
    
    func setupDobPicker() {
        datePicker.locale = Locale(identifier: "ar_LY")
        dobTxtField.inputView = datePicker
        datePicker.preferredDatePickerStyle = .wheels
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "تأكيد", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "إلغاء", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        dobTxtField.inputAccessoryView = toolbar
        datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ar_LY")
        dobTxtField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ar_LY")
        dobTxtField.text = dateFormatter.string(from: sender.date)
    }
    
    func initView() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width * 0.5
        profileImageView.applySketchShadow(color: .brightSkyBlue18, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
        profileImageView.layer.backgroundColor = UIColor.azure.cgColor
        containerView.gradientColor(startColor: .offWhite, endColor: .whiteTwo)
        backView.layer.cornerRadius = 15.0
        backView.horizontalGradeint(startColor: .warmPink, endColor: .pinkRed)
        backView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        backView.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(back)))
        profileImage.layer.cornerRadius = profileImage.frame.width * 0.5
        takePicView.layer.cornerRadius = takePicView.frame.width * 0.5
        confirmBtn.gradientbutton(shadowColor: .red20, startColor: .warmPink, endColor: .pinkRed)
        dobView.customizeView()
        viewFullName.customizeView()
        acceptTermsLbl.attributedText = acceptTermsLbl.customizeTextLabel(stringToColor: "شروط الاستخدام", color: .black, isUnderline: true)
        fullNameLbl.isHidden = true
        dobLbl.isHidden = true
        fullNameTxtField.delegate = self
        dobTxtField.delegate = self
        acceptTermsIcon.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(didAcceptTerms)))
        acceptTermsLbl.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(showTermsScreen)))
        maleView.tag = 0
        femaleView.tag = 1
        maleView.addTapGesture(gesture)
        femaleView.addTapGesture(gesture)
        profileImage.addTapGesture(tapGesture)
        profileAvatar.addTapGesture(tapGesture)
        takePicView.addTapGesture(tapGesture)
        takePicImage.addTapGesture(tapGesture)
        setupLabelFont()
    }
    
    func setupLabelFont() {
        fullNameLbl.font = UIFont(name: "NotoSansArabic-Medium", size: 13)
        dobLbl.font = UIFont(name: "NotoSansArabic-Medium", size: 13)
        confirmBtn.titleLabel?.font = UIFont(name: "NotoSansArabic-Medium", size: 16)
        acceptTermsLbl.font = UIFont(name: "NotoSansArabic-Medium", size: 16)
        maleLbl.font = UIFont(name: "NotoSansArabic-Medium", size: 16)
        femaleLbl.font = UIFont(name: "NotoSansArabic-Medium", size: 16)
        fullNameTxtField.font = UIFont(name: "NotoSansArabic-Medium", size: 16)
        dobTxtField.font = UIFont(name: "NotoSansArabic-Medium", size: 16)
    }
    
    func initProfile(profile: ProfileModel?) {
        if let profile = profile {
            updateIcon(selectedItem: profile.gender  ?? "0")
            if let pic = profile.picture {
                profileAvatar.isHidden = true
                profileImage.isHidden = false
                let url = URL(string: "\(Utilities.baseUrl)\(pic)")
                profileImage.kf.setImage(with: url)
                profileImage.contentMode = .scaleAspectFill
            } else {
                profileAvatar.isHidden = false
                profileImage.isHidden = true
            }
            fullNameTxtField.text = profile.name ?? ""
            dobTxtField.text = profile.birthday ?? ""
            gender = profile.gender ?? "0"
        }
        
    }
    
    func updateIcon(selectedItem: String) {
        gender = selectedItem
        if selectedItem == "1" {
            maleSelectedIcon.image = UIImage(named: "selected_icon")
            femaleSelectedIcon.image = UIImage(named: "unselected_icon")
        } else {
            maleSelectedIcon.image = UIImage(named: "unselected_icon")
            femaleSelectedIcon.image = UIImage(named: "selected_icon")
        }
    }
    
    @IBAction func didUpdateGender(_ sender: UIButton) {
        let tag = sender.tag
        let selectedItem = String(tag)
        updateIcon(selectedItem: selectedItem)
        
    }
    
    @objc func back(){
        self.dismiss(animated: true)
    }
    
    @objc func didAcceptTerms() {
        acceptTerms.toggle()
        acceptTermsIcon.image = UIImage(named: acceptTerms ? "selected_icon":"unselected_icon")
    }
    
    @objc func showTermsScreen() {
        
    }
    
    @IBAction func confirmBtnDidTapped(_ sender: Any) {
        if acceptTerms {
            do {
                let name = try fullNameTxtField.validatedText(validationType: .fullName)
                let dob = try dobTxtField.validatedText(validationType: .Dob)
                validateDobTxt()
                validateFullname()
                let newModel = EditProfileModel(gender: Int(gender) ?? 0, birthday: dob, name: name, picture: profilePic)
                updateProfile(newModel: newModel)
            } catch (let error) {
                if let error = error as? ValidationnError {
                    switch error {
                    case .fullNameError:
                        invalidFullname()
                        break
                    case .passwordError:
                        invalidDob()
                        break
                    default:
                        break
                    }
                }
            }
        } else {
            showAlert(for: "الرجاء الموافقه على شروط الاستخدام")
        }

    }
}


extension ProfileVC: UITextFieldDelegate {
    
    func validateFullname() {
        if fullNameTxtField.text?.isEmpty == false {
            fullNameLbl.isHidden = false
            fullNameLbl.textColor = .azure
            viewFullName.customizeViewWhenValidField()
        }
    }
    
    func validateDobTxt() {
        if dobTxtField.text?.isEmpty == false {
            dobLbl.isHidden = false
            dobLbl.textColor = .azure
            dobView.customizeViewWhenValidField()
        }
    }
    
    func invalidFullname() {
        validateDobTxt()
        fullNameLbl.isHidden = false
        fullNameLbl.customizeLabelWhenError()
        viewFullName.customizeViewWhenInvalidField()
    }
    
    func invalidDob() {
        validateFullname()
        dobLbl.customizeLabelWhenError()
        dobView.customizeViewWhenInvalidField()
    }
    
    func validateTextFieldWhenEndEditing(_ textField: UITextField) {
        if textField == fullNameTxtField {
            do {
                _ = try fullNameTxtField.validatedText(validationType: .fullName)
                validateFullname()
            } catch (let error) {
                if let error = error as? ValidationnError {
                    switch error {
                    case .fullNameError:
                        invalidFullname()
                        break
                    default:
                        break
                    }
                }
            }
        } else {
            do {
                _ = try dobTxtField.validatedText(validationType: .Dob)
                validateDobTxt()
            } catch (let error) {
                if let error = error as? ValidationnError {
                    switch error {
                    case .dobError:
                        invalidDob()
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
        if textField == fullNameTxtField {
            fullNameLbl.isHidden = true
            fullNameLbl.customizeLabelWhenValid()
            viewFullName.customizeView()
        } else {
            dobLbl.customizeLabelWhenValid()
            dobLbl.isHidden = true
            dobView.customizeView()
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called")
        validateTextFieldWhenEndEditing(textField)
    }
    
    
}
