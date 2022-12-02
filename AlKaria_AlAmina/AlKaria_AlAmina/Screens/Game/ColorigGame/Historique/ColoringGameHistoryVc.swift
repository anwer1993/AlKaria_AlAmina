//
//  ColoringGameHistoryVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 27/11/2022.
//

import Foundation
import UIKit

class ColoringGameHistoryVc: UIViewController, Storyboarded {
    
    
    @IBOutlet weak var imageCollectionFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var backIcon: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    var imageHistories = [ImageHistoryModel]()
    var game_id: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        getHistorique(game_id: game_id)
    }
    
    func initView() {
        containerView.gradientColor(startColor: .offWhite, endColor: .paleSkyBlue)
        backView.layer.cornerRadius = 15.0
        backView.horizontalGradeint(startColor: .warmPink, endColor: .pinkRed)
        backView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        backView.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(back)))
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
    }
    
    @objc func back(){
        self.dismiss(animated: true)
    }
    
}

extension ColoringGameHistoryVc: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageHistories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as? GameCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(image: imageHistories[indexPath.row].picture ?? "", fromHistoryScreen: true)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
//        Router.shared.present(screen: .ColoringGame(gameImageModel: Utilities.coloringGameMenu[indexPath.row]), modalePresentatioinStyle: .fullScreen, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let padding: CGFloat = 10.0
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize * 0.5, height: collectionViewSize * 0.5)
    }
    
    
}
