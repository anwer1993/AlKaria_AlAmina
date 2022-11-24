//
//  CustomPopup.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 16/11/2022.
//

import Foundation
import UIKit
import Lottie

class CustomPopup: UIViewController, SubViewConroller {
    
    

    @IBOutlet weak var gameNameLbl: UILabel!
    @IBOutlet weak var gameDiscriptionLbl: UILabel!
    @IBOutlet weak var playNowBtn: GradientButton!
    @IBOutlet weak var subviewContainer: UIView!
    @IBOutlet weak var viewControl: UIControl!
    @IBOutlet var containerView: UIView!
    
    var handleTapWhenDismiss: () -> Void  = {}
    var game: GameDescriptionModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func initView() {
        viewControl.addTarget(self, action: #selector(removeView(_:)), for: .touchUpInside)
        viewControl.alpha = 0.5
        viewControl.layer.backgroundColor = UIColor.gray.cgColor
        subviewContainer.layer.cornerRadius = 20.0
        subviewContainer.layer.backgroundColor = UIColor.white.cgColor
        playNowBtn.layer.cornerRadius = 15
        playNowBtn.layer.backgroundColor = UIColor.warmPink.cgColor
        playNowBtn.applySketchShadow(color: .red20, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
        gameNameLbl.textColor = .pinkRed
        if let game = game {
            gameNameLbl.text = game.name ?? ""
            gameDiscriptionLbl.text = game.desc ?? ""
            if game.name == "الاختلافات بين الصور" {
                playNowBtn.setTitle("عن قريب", for: .normal)
            } else {
                playNowBtn.setTitle("إلعب الآن", for: .normal)
            }
        }
    }
    
    @objc func removeView(_ gesture: UIGestureRecognizer) {
        removeView()
    }
    
    func removeView() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        removeView()
        handleTapWhenDismiss()
    }
}
