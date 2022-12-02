//
//  HomeVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 07/11/2022.
//

import UIKit
import Lottie

class HomeVc: UIViewController, Storyboarded {

    
    @IBOutlet weak var lottieView: LottieAnimationView!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var birthImage: UIImageView!
    @IBOutlet weak var splachIcon: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var viewProfileImage: UIView!
    @IBOutlet weak var containerView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        getProfile(completion: {_ in})
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        lottieView.setupLottieView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func initView() {
        containerView.gradientColor(startColor: .offWhite, endColor: .paleSkyBlue)
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.tableFooterView = UIView()
        viewProfileImage.layer.cornerRadius = viewProfileImage.frame.width * 0.5
        viewProfileImage.layer.backgroundColor = UIColor.white.cgColor
        profileImage.isHidden = true
        viewProfileImage.applySketchShadow(color: .black810, alpha: 1, x: 0, y: 6, blur: 30, spread: 0)
        viewProfileImage.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(showProfileDetails)))
    }
    
    @objc func showProfileDetails() {
        Router.shared.present(screen: .Profile, modalePresentatioinStyle: .fullScreen, completion: nil)
    }

}


extension HomeVc: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "menuCellModel", for: indexPath) as? HomeMenuTableViewCell else {
            return UITableViewCell()
        }
        cell.setCell(model: Utilities.menu[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            Router.shared.present(screen: .Tabbar(selectedIndex: 1), modalePresentatioinStyle: .fullScreen, completion: nil)
        } else if indexPath.row == 1 {
            Router.shared.present(screen: .Tabbar(selectedIndex: 2), modalePresentatioinStyle: .fullScreen, completion: nil)
        } else {
            Router.shared.present(screen: .ContactUs, modalePresentatioinStyle: .fullScreen, completion: nil)
        }
    }
    
}
