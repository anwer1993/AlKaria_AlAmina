//
//  ProfileVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 13/11/2022.
//

import Foundation
import UIKit

class  PartenareDetailsVc: UIViewController, SubViewConroller {
    
    
    
    
    @IBOutlet weak var partenarImage: UIImageView!
    @IBOutlet weak var parntenarNameLbl: UILabel!
    @IBOutlet weak var partenarViewContainer: UIView!
    @IBOutlet weak var controlView: UIControl!
    @IBOutlet var containerView: UIView!
    
    var partenar: PartenarModel?
    
    
    var handleTapWhenDismiss: () -> Void  = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func initView() {
        parntenarNameLbl.font = UIFont(name: "NotoSansArabic-Regular", size: 16)
        controlView.addTarget(self, action: #selector(removeView(_:)), for: .touchUpInside)
        controlView.alpha = 0.5
        controlView.layer.backgroundColor = UIColor.gray.cgColor
        partenarViewContainer.layer.cornerRadius = 20
        partenarViewContainer.layer.backgroundColor = UIColor.white.cgColor
        if let partenar = partenar {
            partenarImage.image = UIImage(named: partenar.image ?? "")!
            parntenarNameLbl.text = partenar.name ?? ""
        }
    }
    
    @objc func removeView(_ gesture: UIGestureRecognizer) {
        removeView()
    }
    
    func removeView() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
        handleTapWhenDismiss()
    }
    
}
