//
//  ScoreVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 23/11/2022.
//

import UIKit

class ScoreVc: UIViewController, Storyboarded {

    
    
    
    
    
    @IBOutlet weak var gameFinishedLbl: UILabel!
    @IBOutlet weak var myScoreStaticLabel: UILabel!
    @IBOutlet weak var bestScoreStaticLbl: UILabel!
    @IBOutlet weak var bestScoreStaticLabel: UILabel!
    @IBOutlet weak var myScoreLbl: UILabel!
    @IBOutlet weak var myScoreView: UIView!
    @IBOutlet weak var backBtn: UILabel!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var bestScoreLbl: UILabel!
    @IBOutlet weak var bestScoreView: UIView!
    @IBOutlet weak var bottomBackBtn: UIButton!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    var myScore: Int = 0
    var bestScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        setupScoreView(view: myScoreView)
        setupScoreView(view: bestScoreView)
        screenTitle.textColor = .pinkRed
        gameFinishedLbl.textColor = .pinkRed
        myScoreLbl.text = "\(myScore)"
        bestScoreLbl.text = "\(bestScore)"
    }
    
    func setupScoreView(view: UIView) {
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.aqua.cgColor
        view.layer.cornerRadius = 10
    }

    @IBAction func backBtnDidTapped(_ sender: Any) {
        Router.shared.present(screen: .Tabbar(selectedIndex: 2), modalePresentatioinStyle: .fullScreen, completion: nil)
    }
    

}
