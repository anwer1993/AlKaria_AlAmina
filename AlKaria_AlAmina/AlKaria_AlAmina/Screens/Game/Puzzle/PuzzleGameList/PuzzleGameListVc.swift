//
//  PuzzleGameListVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 16/11/2022.
//

import UIKit

class PuzzleGameListVc: UIViewController, Storyboarded {

    @IBOutlet weak var gamesCollectionView: UICollectionView!
    @IBOutlet weak var standingImage: UIImageView!
    @IBOutlet weak var standingView: UIView!
    @IBOutlet weak var screenTitleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    var games: [GameEnum] = [.firstGame,.secondGame,.thirdGame,.fourthGame, .fivthGame, .sexthGame, .seventhGame, .eighGame]
    
    let standingVc = StandingVc(nibName: "StandingVc", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        containerView.gradientColor(startColor: .offWhite, endColor: .paleSkyBlue)
        gamesCollectionView.delegate = self
        gamesCollectionView.dataSource = self
        standingView.layer.cornerRadius = 8
        standingView.layer.backgroundColor = UIColor.azure.cgColor
        standingView.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(showStanding)))
        standingImage.imageTintColor(image: "icon_awesome_history", color: .white)
        screenTitleLbl.font = UIFont(name: "NotoSansArabic-Bold", size: 25)
    }

    
    @objc  func showStanding() {
        getScore(game_id: 0)
    }
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PuzzleGameListVc: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as? GameCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(image: games[indexPath.row].rawValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        Router.shared.present(screen: .Puzzle(game: games[indexPath.row]), modalePresentatioinStyle: .fullScreen, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let padding: CGFloat = 10.0
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize * 0.5, height: collectionViewSize * 0.5)
    }
    
    
}
