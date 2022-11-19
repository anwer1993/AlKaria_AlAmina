//
//  ForgotPasswordVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 02/11/2022.
//

import UIKit

class ForgotPasswordVc: UIViewController, Storyboarded {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var stepThreelbl: UILabel!
    @IBOutlet weak var viewStepThree: UIView!
    @IBOutlet weak var stepTwoLbl: UILabel!
    @IBOutlet weak var viewStepTwo: UIView!
    @IBOutlet weak var stepOneLbl: UILabel!
    @IBOutlet weak var viewStepOne: UIView!
    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var phonelbl: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var viewPhoneNumber: UIView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var sendBtn: GradientButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }

    func disableNextSteps(view: UIView, label: UILabel) {
        view.alpha = 0.7
        label.alpha = 0.7
        label.textColor = .brownishGrey
    }
    
    func initView() {
        viewContainer.gradientColor(startColor: .offWhite, endColor: .whiteTwo)
        sendBtn.gradientbutton(shadowColor: .red20, startColor: .warmPink, endColor: .pinkRed)
        backView.layer.cornerRadius = 15.0
        backView.horizontalGradeint(startColor: .warmPink, endColor: .pinkRed)
        backView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        viewStepOne.layer.backgroundColor = UIColor.appleGreen.cgColor
        viewPhoneNumber.customizeView()
        viewStepOne.layer.cornerRadius = viewStepOne.frame.width * 0.5
        viewStepTwo.layer.cornerRadius = viewStepTwo.frame.width * 0.5
        viewStepThree.layer.cornerRadius = viewStepThree.frame.width * 0.5
        stepOneLbl.textColor = .white
        disableNextSteps(view: viewStepTwo, label: stepTwoLbl)
        disableNextSteps(view: viewStepThree, label: stepThreelbl)
        backView.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(back)))
        phonelbl.isHidden = true
    }
    
    
    @IBAction func sendBtnDidTapped(_ sender: Any) {
        Router.shared.push(with: self.navigationController, screen: .OTPScreen, animated: true)
    }
    
}
