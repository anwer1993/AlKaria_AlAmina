//
//  UIViewExtension.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 02/11/2022.
//

import Foundation
import UIKit

extension  UIView {
    
    func menuViewGradientColor(startColor: UIColor, endColor: UIColor, cornerRadius: CGFloat = 0.0)  {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.cornerRadius = cornerRadius
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func headerGradientColor(startColor: UIColor, endColor: UIColor, cornerRadius: CGFloat = 0.0)  {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.cornerRadius = cornerRadius
        gradient.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func gradientColor(startColor: UIColor, endColor: UIColor, cornerRadius: CGFloat = 0.0)  {
        let gradient = CAGradientLayer()
        gradient.frame = UIScreen.main.bounds
        gradient.cornerRadius = cornerRadius
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func horizontalGradeint(startColor: UIColor, endColor: UIColor, cornerRadius: CGFloat = 15.0) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.cornerRadius = 15
        gradient.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applySketchShadow(color: UIColor , alpha: Float, x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = alpha
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowRadius = blur / 2.0
        if spread == 0 {
            self.layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            self.layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    func customizeView() {
        self.layer.cornerRadius = 15.0
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
        self.applySketchShadow(color: .black8, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
    }
    
    func customizeViewWhenValidField() {
        customizeView()
        self.layer.borderColor = UIColor.black85.cgColor
        self.layer.borderWidth = 1.0
        self.layer.backgroundColor = UIColor.black85.cgColor
    }
    
    func customizeViewWhenInvalidField() {
        customizeView()
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func addTapGesture(_ tap:UITapGestureRecognizer) {
        isUserInteractionEnabled = true
        addGestureRecognizer(tap)
    }
    
}
