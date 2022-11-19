//
//  PuzzleGameVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 15/11/2022.
//

import Foundation
import UIKit
import Lottie

class PuzzleGameVc: UIViewController, Storyboarded {
    
    
    @IBOutlet weak var boardView: BoardView!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    
    @IBOutlet weak var backToPreviousVc: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var congratulationAnimationView: LottieAnimationView!
    @IBOutlet weak var congratulationLbl: UILabel!
    @IBOutlet weak var congratulationPopup: UIView!
    @IBOutlet weak var controlView: UIControl!
    
    var movesCount: Int = 0 {
        didSet {
            scoreLbl.text = "عدد الخطوات : \(movesCount)"
        }
    }
    var games: [GameEnum] = [.firstGame,.secondGame,.thirdGame,.fourthGame, .fivthGame, .sexthGame, .seventhGame, .eighGame]
    var game: GameEnum = .firstGame
    var startPlay: Bool  = false
    let customPopupVc = CustomPopup(nibName: "CustomPopup", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initButtonImage() {
        self.boardView.subviews.forEach { view in
            if let  button = view as? UIButton {
                print("\(game.rawValue)\(button.tag)")
                button.setImage(UIImage(named: "\(game.rawValue)_\(button.tag)"), for: .normal)
            }
        }
    }
    
    func initView() {
        startPlay = false
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let board = appDelegate.board!
        board.resetBoard()
        self.boardView.setNeedsLayout()
        containerView.gradientColor(startColor: .offWhite, endColor: .paleSkyBlue)
        self.boardView.layer.backgroundColor = UIColor.clear.cgColor
        playBtn.layer.cornerRadius = 15
        playBtn.layer.backgroundColor = UIColor.warmPink.cgColor
        playBtn.applySketchShadow(color: .red20, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
        initButtonImage()
        controlView.alpha = 0.5
        controlView.layer.backgroundColor = UIColor.gray.cgColor
        congratulationPopup.layer.cornerRadius = 20.0
        congratulationPopup.layer.backgroundColor = UIColor.white.cgColor
        backBtn.layer.cornerRadius = 15
        backBtn.layer.backgroundColor = UIColor.warmPink.cgColor
        backBtn.applySketchShadow(color: .red20, alpha: 1, x: 0, y: 10, blur: 30, spread: 0)
        controlView.isHidden = true
        congratulationPopup.isHidden = true
        backToPreviousVc.layer.cornerRadius = 15
        backToPreviousVc.layer.borderColor = UIColor.black.cgColor
        backToPreviousVc.layer.borderWidth = 2
        backToPreviousVc.layer.backgroundColor = UIColor.peachyPink.cgColor
    }
    
    @IBAction func tileSelected(_ sender: UIButton) {
        if startPlay == false {return}
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let board = appDelegate.board
        let pos = board!.getRowAndColumn(forTile: sender.tag)
        let buttonBounds = sender.bounds
        var buttonCenter = sender.center
        var slide = true
        if board!.canSlideTileUp(atRow: pos!.row, Column: pos!.column) {
            buttonCenter.y -= buttonBounds.size.height
        } else if board!.canSlideTileDown(atRow: pos!.row, Column: pos!.column) {
            buttonCenter.y += buttonBounds.size.height
        } else if board!.canSlideTileLeft(atRow: pos!.row, Column: pos!.column) {
            buttonCenter.x -= buttonBounds.size.width
        } else if board!.canSlideTileRight(atRow: pos!.row, Column: pos!.column) {
            buttonCenter.x += buttonBounds.size.width
        } else {
            slide = false
        }
        if slide {
            board!.slideTile(atRow: pos!.row, Column: pos!.column)
            movesCount += 1
            print("moves", movesCount)
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {sender.center = buttonCenter})
            if (board!.isSolved()) {
                insertScore()
                movesCount = 0
                controlView.isHidden = false
                congratulationPopup.isHidden = false
                self.congratulationAnimationView.setupLottieView(animation: "congratulations")
            }
        }
    }
    
    func startAnotherGame() {
        movesCount = 0
        if var index = games.firstIndex(of: self.game) {
            index += 1
            if  index >= 8 {
                index = 0
                self.game = games[index]
                initView()
            } else {
                self.game = games[index]
                initView()
            }
        }
    }
    
    //@IBAction func shuffleTiles(_ sender: AnyObject) {
    @IBAction func shuffleTiles(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let board = appDelegate.board!
        let shuffle = (sender.tag == 30)
        
        if (shuffle) {
            startPlay = true
            board.scramble(numTimes: appDelegate.numShuffles)
            sender.tag = 31
            sender.setTitle("أنظر الإصلاح", for: .normal)
            self.boardView.setNeedsLayout()
            movesCount = 0
        } else {
            startPlay = false
            sender.tag = 30
            sender.setTitle("بعثر و إبدأ", for: .normal)
            board.resetBoard()
            movesCount = 0
            self.boardView.setNeedsLayout()
        }
    }
    
    @IBAction func backAfterWinBtnDidTapped(_ sender: Any) {
        startAnotherGame()
    }
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        controlView.isHidden = true
        congratulationPopup.isHidden = true
        self.dismiss(animated: true)
    }
}
