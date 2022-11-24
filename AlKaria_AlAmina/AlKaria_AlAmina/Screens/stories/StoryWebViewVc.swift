//
//  StoryWebViewVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 13/11/2022.
//

import UIKit
import WebKit

class StoryWebViewVc: UIViewController, Storyboarded, WKNavigationDelegate {
    
    
    
    
    @IBOutlet weak var backIcon: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var containerView: UIView!
    
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let url = URL (string: self.url) {
            webView.navigationDelegate = self
            showLoader()
            let requestObj = URLRequest(url: url)
            webView.load(requestObj)
        }
    }
    
    func initView() {
//        backView.layer.cornerRadius = 15.0
//        backView.horizontalGradeint(startColor: .warmPink, endColor: .pinkRed)
//        backView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
//        backView.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(back)))
//        backView.isHidden = true
    }
    
    @objc func back(){
        self.dismiss(animated: true)
    }
    
    func webView(_ webView: WKWebView,didFinish navigation: WKNavigation!) {
        print("finish loading")
        hideLoader()
    }
    
}
