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
    
    var gesture: UITapGestureRecognizer {
        return UITapGestureRecognizer(target: self, action: #selector(didUpdateGender(_:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initProfile()
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
    }
    
    
    func initProfile() {
        if let profile = AccountManager.shared.profile {
            updateIcon(selectedItem: profile.gender  ?? "0")
            if let pic = profile.picture {
                profileAvatar.isHidden = true
                profileImage.isHidden = false
                let url = URL(string: pic)
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
        if selectedItem == "0" {
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
    
}


extension ProfileVC: UITextFieldDelegate {
    
}
