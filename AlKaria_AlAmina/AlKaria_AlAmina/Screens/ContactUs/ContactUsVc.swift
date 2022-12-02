//
//  ContactUsVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 13/11/2022.
//

import UIKit
import Lottie

class ContactUsVc: UIViewController, Storyboarded{
    
    @IBOutlet weak var sendBtn: GradientButton!
    @IBOutlet weak var suggestionsTxtView: UITextView!
    @IBOutlet weak var suggestionsLbl: UILabel!
    @IBOutlet weak var suggestionsView: UIView!
    @IBOutlet weak var contentDescTxtView: UITextView!
    @IBOutlet weak var contentsDescLbl: UILabel!
    @IBOutlet weak var contentsDDescView: UIView!
    @IBOutlet weak var tripDescTxtView: UITextView!
    @IBOutlet weak var tripDescLbl: UILabel!
    @IBOutlet weak var tripDescView: UIView!
    @IBOutlet weak var butterflyAnimationView: LottieAnimationView!
    @IBOutlet weak var birdAnimationView: LottieAnimationView!
    @IBOutlet weak var ScreenImage: UIImageView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var polygoneIcon: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var backIcon: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        birdAnimationView.setupLottieView()
        butterflyAnimationView.setupLottieView(animation: "butterfly1")
    }
    
    func initView() {
        containerView.gradientColor(startColor: .offWhite, endColor: .paleSkyBlue)
        setupViewTxtView(view: tripDescView, txtView: tripDescTxtView, lbl: tripDescLbl)
        setupViewTxtView(view: contentsDDescView, txtView: contentDescTxtView, lbl: contentsDescLbl)
        setupViewTxtView(view: suggestionsView, txtView: suggestionsTxtView, lbl: suggestionsLbl)
        backView.layer.cornerRadius = 15.0
        backView.horizontalGradeint(startColor: .warmPink, endColor: .pinkRed)
        backView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        backView.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(back)))
        sendBtn.gradientbutton(shadowColor: .red20, startColor: .warmPink, endColor: .pinkRed)
        scrollView.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(endEditingText)))
        suggestionsTxtView.delegate = self
        tripDescTxtView.delegate = self
        contentDescTxtView.delegate = self
    }
    
    func setupViewTxtView(view: UIView, txtView: UITextView, lbl: UILabel) {
        view.layer.cornerRadius = 15.0
        view.layer.backgroundColor = UIColor.white.cgColor
        view.applySketchShadow(color: .black8, alpha: 1, x: 0, y: 3, blur: 9, spread: 0)
        txtView.layer.cornerRadius = 10.0
        txtView.layer.backgroundColor = UIColor.black85.cgColor
        lbl.textColor = .azure
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func back(){
        self.dismiss(animated: true)
    }
    
    @objc func endEditingText(){
        self.view.endEditing(true)
    }

    @IBAction func sendBtnDidTapped(_ sender: Any) {
        if tripDescTxtView.text == "" || tripDescTxtView.text == " " || tripDescTxtView.text == "مكان مخصص للكتابة" {
            invalidateTextView(view: tripDescView, label: tripDescLbl, textView: tripDescTxtView)
        } else if contentDescTxtView.text == "" || contentDescTxtView.text == " " || contentDescTxtView.text == "مكان مخصص للكتابة" {
            invalidateTextView(view: contentView, label: contentsDescLbl, textView: contentDescTxtView)
        } else if suggestionsTxtView.text == "" || contentDescTxtView.text == " " || contentDescTxtView.text == "مكان مخصص للكتابة" {
            invalidateTextView(view: suggestionsView, label: suggestionsLbl, textView: suggestionsTxtView)
        } else {
            sendFeedback(response_1: tripDescTxtView.text, response_2: contentDescTxtView.text, response_3: contentDescTxtView.text)
        }
    }
}


extension  ContactUsVc: UITextViewDelegate {
    
    func invalidateTextView(view: UIView, label: UILabel, textView: UITextView) {
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 1
        label.textColor = .red
        sendBtn.setTitle("خطأ", for: .normal)
    }
    
    func validateTextView(view: UIView, label: UILabel, textView: UITextView) {
        view.layer.borderWidth = 0
        label.textColor = .azure
        sendBtn.setTitle("تسجيل", for: .normal)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "مكان مخصص للكتابة" {
            textView.text = ""
        }
        if  textView ==  tripDescTxtView {
            validateTextView(view: tripDescView, label: tripDescLbl, textView: tripDescTxtView)
        } else if textView == contentDescTxtView {
            validateTextView(view: contentView, label: contentsDescLbl, textView: contentDescTxtView)
        } else if textView == suggestionsTxtView {
            validateTextView(view: suggestionsView, label: suggestionsLbl, textView: suggestionsTxtView)
        }
    }
    
}
