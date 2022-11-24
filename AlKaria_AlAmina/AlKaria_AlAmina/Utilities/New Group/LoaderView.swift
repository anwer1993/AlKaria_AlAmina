//
//  LoaderView.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 17/11/2022.
//

import Foundation
import UIKit

class LoaderView: UIView {
    
    @IBOutlet weak var controlView: UIControl!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var traceView: UIImageView!
    @IBOutlet weak var subViewContainer: UIView!
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("LoaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        contentView.center = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
        contentView.layer.backgroundColor = UIColor.clear.cgColor
        subViewContainer.layer.cornerRadius  =  20.0
        subViewContainer.layer.backgroundColor = UIColor.white.cgColor
        controlView.alpha = 0.2
        controlView.layer.backgroundColor = UIColor.black.cgColor
        contentView.tag = Utilities.loaderViewTag
        rotate()
    }
    
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = CGFloat(Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = .greatestFiniteMagnitude
        self.traceView.layer.add(rotation, forKey: "rotationAnimation")
    }
    
}
