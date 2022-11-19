//
//  PartenarsVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 08/11/2022.
//

import UIKit
import Lottie

class PartenarsVc: UIViewController, Storyboarded {
    
    @IBOutlet weak var partenarsCollectionView: UICollectionView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var polygoneIcon: UIImageView!
    @IBOutlet weak var birthIcon: UIImageView!
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var avatarIcon: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var viewprofileImage: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    var animationView: LottieAnimationView?
    
    let partenareDetailsVC = PartenareDetailsVc(nibName: "PartenareDetailsVc", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        getProfile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        lottieView.setupLottieView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        partenareDetailsVC.removeView()
    }
    
    func initView() {
        containerView.gradientColor(startColor: .offWhite, endColor: .paleSkyBlue)
        partenarsCollectionView.delegate = self
        partenarsCollectionView.dataSource = self
        viewprofileImage.layer.cornerRadius = viewprofileImage.frame.width * 0.5
        viewprofileImage.layer.backgroundColor = UIColor.white.cgColor
        profileImage.isHidden = true
        viewprofileImage.applySketchShadow(color: .black810, alpha: 1, x: 0, y: 6, blur: 30, spread: 0)
        viewprofileImage.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(showProfileDetails)))
        viewprofileImage.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(showProfileDetails)))
    }
    
    @objc func showProfileDetails() {
        Router.shared.present(screen: .Profile, modalePresentatioinStyle: .fullScreen, completion: nil)
    }
    
}

extension PartenarsVc: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Utilities.partenars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartenarCollectionViewCell", for: indexPath) as? PartenarCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(model: Utilities.partenars[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        collectionView.deselectItem(at: indexPath, animated: true)
        partenareDetailsVC.partenar = Utilities.partenars[indexPath.row]
        addChildVc(partenareDetailsVC) {
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let padding: CGFloat = 10.0
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize * 0.5, height: collectionViewSize * 0.5)
    }
    
    
}
