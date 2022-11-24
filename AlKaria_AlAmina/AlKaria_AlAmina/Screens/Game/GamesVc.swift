//
//  GamesVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 08/11/2022.
//

import UIKit
import Lottie

class GamesVc: UIViewController, Storyboarded {
    
    
    @IBOutlet weak var gameTableView: UITableView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var polygoneIcon: UIImageView!
    @IBOutlet weak var birthIcon: UIImageView!
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var avatarIcon: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var viewprofileImage: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    let customPopup = CustomPopup(nibName: "CustomPopup", bundle: nil)
    
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
    
    func initView() {
        containerView.gradientColor(startColor: .offWhite, endColor: .paleSkyBlue)
        gameTableView.delegate = self
        gameTableView.dataSource = self
        gameTableView.tableFooterView = UIView()
        viewprofileImage.layer.cornerRadius = viewprofileImage.frame.width * 0.5
        viewprofileImage.layer.backgroundColor = UIColor.white.cgColor
        profileImage.isHidden = true
        viewprofileImage.applySketchShadow(color: .black810, alpha: 1, x: 0, y: 6, blur: 30, spread: 0)
        viewprofileImage.addTapGesture(UITapGestureRecognizer(target: self, action: #selector(showProfileDetails)))
    }

    @objc func showProfileDetails() {
        Router.shared.present(screen: .Profile, modalePresentatioinStyle: .fullScreen, completion: nil)
    }
    
}

extension GamesVc: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "gameCellModel", for: indexPath) as? GameMenuTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(model: Utilities.gameMenu[indexPath.row])
        cell.delegate = self
        cell.index = indexPath.row
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension GamesVc: PlayGameDelegate {
    func play(index: Int?) {
        
        if index == 0 {
            startPlay(game: GameDescriptionModel(name: "لعبة هيا نلون", desc: "رسومات متعددة و متجددة، حلق بألوانك، و خيالك في عالم القرية الآمنة المضيء بالألوان")) {
                Router.shared.present(screen: .ColoringGameList, modalePresentatioinStyle: .fullScreen, completion: nil)
            }
        } else if index == 1 {
            startPlay(game: GameDescriptionModel(name: "الصورة المبعثرة", desc: "تبعثرت أجزاء بعض الصور ساعدنا في ترتيبها بالطريقة الصحيحة")) {
                Router.shared.present(screen: .ListPuzzle, modalePresentatioinStyle: .fullScreen, completion: nil)
            }
        } else if index == 2 {
            startPlay(game: GameDescriptionModel(name: "فصل الألوان", desc: "هناك لون مختلف بين الألوان. هل يمكنك اكتشافه؟")) {
                Router.shared.present(screen: .ColorDifferentGame, modalePresentatioinStyle: .fullScreen, completion: nil)
            }
        } else if index == 3 {
            startPlay(game: GameDescriptionModel(name: "الاختلافات بين الصور", desc: "قريبا سيتم نشر هذه اللعبة في النسخة القادمة.")) {
                
            }
        }
        
    }
    
    func startPlay(game: GameDescriptionModel, completion: @escaping () -> ()) {
        customPopup.game = game
        addChildVc(customPopup){
            completion()
        }
    }
}
