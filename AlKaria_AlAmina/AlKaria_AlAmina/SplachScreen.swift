//
//  ViewController.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 01/11/2022.
//

import UIKit

class SplachScreen: UIViewController {
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var logoimage: UIImageView!
    @IBOutlet weak var logoImageLeadingConstrainte: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSettings()
        initView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        animateLogo {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if AccountManager.shared.token != nil {
                    Router.shared.push(with: self.navigationController, screen: .Tabbar(selectedIndex: 0), animated: true)
                } else {
                    Router.shared.push(with: self.navigationController, screen: .Login, animated: true)
                }
            }
        }
    }
    
    func initView() {
        logoimage.alpha = 0.7
        
    }
    
    func animateLogo(onFinished: @escaping () -> ()) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
            self.logoimage.frame.origin.x = (self.view.bounds.maxX * 0.5) - (self.logoimage.bounds.width * 0.5)
        } completion: { _ in
            onFinished()
        }
    }
    
}

