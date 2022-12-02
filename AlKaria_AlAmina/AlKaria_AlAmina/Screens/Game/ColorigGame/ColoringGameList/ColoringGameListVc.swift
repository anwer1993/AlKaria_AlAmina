//
//  ColoringGameListVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 21/11/2022.
//

import UIKit

import UIKit

class ColoringGameListVc: UIViewController, Storyboarded {

    @IBOutlet weak var historiqueImage: UIImageView!
    @IBOutlet weak var gamesCollectionView: UICollectionView!
    @IBOutlet weak var screenTitleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        containerView.gradientColor(startColor: .offWhite, endColor: .paleSkyBlue)
        gamesCollectionView.delegate = self
        gamesCollectionView.dataSource = self
        screenTitleLbl.font = UIFont(name: "NotoSansArabic-Bold", size: 25)
    }

    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }

}

extension ColoringGameListVc: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Utilities.coloringGameMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColoringGameCollectionViewCell", for: indexPath) as? ColoringGameCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.setupCell(model: Utilities.coloringGameMenu[indexPath.row], index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let padding: CGFloat = 10.0
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize * 0.5, height: collectionViewSize * 0.5)
    }
    
}


extension ColoringGameListVc: ColoringGameProtocol {
    func goToPlay(index: Int) {
        Router.shared.present(screen: .ColoringGame(gameImageModel: Utilities.coloringGameMenu[index]), modalePresentatioinStyle: .fullScreen, completion: nil)
    }
    
    func seeHistorique(index: Int) {
        Router.shared.present(screen: .Historique(game_id: Utilities.coloringGameMenu[index].id), modalePresentatioinStyle: .fullScreen, completion: nil)
    }
    
    
}
