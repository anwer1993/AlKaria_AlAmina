//
//  CustomTabbar.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 07/11/2022.
//

import Foundation
import UIKit


class CustomTabbar: UIView {
    
    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var homeIcon: UIImageView!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var storiesIcon: UIImageView!
    @IBOutlet weak var storiesView: UIView!
    @IBOutlet weak var gameIcon: UIImageView!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var friendIcon: UIImageView!
    @IBOutlet weak var friendView: UIView!
    @IBOutlet weak var partenarIcon: UIImageView!
    @IBOutlet weak var partenarView: UIView!
    @IBOutlet weak var stackViewContainer: UIStackView!
    
    var selectedItem = 0 {
        didSet {
            setupSelectedItem(selectedItem: self.selectedItem)
            self.didSelectItem(self.selectedItem)
        }
    }
    
    var didSelectItem : (Int) -> Void = {_ in}
    
    var recognizer: UITapGestureRecognizer {
        get {
            return UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    func updateImage() {
        if selectedItem == 0 {
            homeIcon.imageTintColor(image: "home_tabbar_icon", color: .white)
            storiesIcon.resetImageTintColor(image: "stories_tabbar_icon")
            gameIcon.resetImageTintColor(image: "game_tabbar_icon")
            friendIcon.resetImageTintColor(image: "friends_tabbar_icon")
            partenarIcon.resetImageTintColor(image: "partenare_tabbar_icon")
        } else if selectedItem == 1 {
            homeIcon.resetImageTintColor(image: "home_tabbar_icon")
            storiesIcon.imageTintColor(image: "stories_tabbar_icon",  color: .white)
            gameIcon.resetImageTintColor(image: "game_tabbar_icon")
            friendIcon.resetImageTintColor(image: "friends_tabbar_icon")
            partenarIcon.resetImageTintColor(image: "partenare_tabbar_icon")
        }  else if selectedItem == 2 {
            homeIcon.resetImageTintColor(image: "home_tabbar_icon")
            gameIcon.imageTintColor(image: "game_tabbar_icon",  color: .white)
            storiesIcon.resetImageTintColor(image: "stories_tabbar_icon")
            friendIcon.resetImageTintColor(image: "friends_tabbar_icon")
            partenarIcon.resetImageTintColor(image: "partenare_tabbar_icon")
        }  else if selectedItem == 3 {
            homeIcon.resetImageTintColor(image: "home_tabbar_icon")
            friendIcon.imageTintColor(image: "friends_tabbar_icon",  color: .white)
            storiesIcon.resetImageTintColor(image: "stories_tabbar_icon")
            gameIcon.resetImageTintColor(image: "game_tabbar_icon")
            partenarIcon.resetImageTintColor(image: "partenare_tabbar_icon")
        } else {
            homeIcon.resetImageTintColor(image: "home_tabbar_icon")
            partenarIcon.imageTintColor(image: "partenare_tabbar_icon",  color: .white)
            storiesIcon.resetImageTintColor(image: "stories_tabbar_icon")
            friendIcon.resetImageTintColor(image: "friends_tabbar_icon")
            gameIcon.resetImageTintColor(image: "game_tabbar_icon")
        }

    }
    
    func setupSelectedItem(selectedItem: Int) {
        print("selectedItem", selectedItem)
        updateImage()
        if selectedItem == 0 {
            selectItem(view: homeView)
            deselectItem(view: storiesView)
            deselectItem(view: gameView)
            deselectItem(view: friendView)
            deselectItem(view: partenarView)
        } else if selectedItem == 1 {
            selectItem(view: storiesView)
            deselectItem(view: homeView)
            deselectItem(view: gameView)
            deselectItem(view: friendView)
            deselectItem(view: partenarView)
        }  else if selectedItem == 2 {
            selectItem(view: gameView)
            deselectItem(view: storiesView)
            deselectItem(view: homeView)
            deselectItem(view: friendView)
            deselectItem(view: partenarView)
        }  else if selectedItem == 3 {
            selectItem(view: friendView)
            deselectItem(view: storiesView)
            deselectItem(view: gameView)
            deselectItem(view: homeView)
            deselectItem(view: partenarView)
        } else {
            selectItem(view: partenarView)
            deselectItem(view: storiesView)
            deselectItem(view: gameView)
            deselectItem(view: friendView)
            deselectItem(view: homeView)
        }
    }
    
    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("CustomTabbar", owner: self, options: nil)
        addSubview(viewContent)
        viewContent.layer.backgroundColor = UIColor.white.cgColor
        viewContent.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        viewContent.center = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
        viewContent.layer.backgroundColor = UIColor.clear.cgColor
//        selectedItem = 0
        setupSelectedItem(selectedItem: self.selectedItem)
        self.didSelectItem(self.selectedItem)
        homeView.addTapGesture(recognizer)
        homeView.tag = 0
//        homeIcon.imageTintColor(image: "home_tabbar_icon", color: .azure)
        storiesView.addTapGesture(recognizer)
        storiesView.tag = 1
        gameView.addTapGesture(recognizer)
        gameView.tag = 2
        friendView.addTapGesture(recognizer)
        friendView.tag = 3
        partenarView.addTapGesture(recognizer)
        partenarView.tag = 4
    }
    
    func imageTintColor(imageView: UIImageView, image: String, color: UIColor) {
        imageView.image = UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = color
    }
    
    func selectItem(view: UIView) {
        view.layer.cornerRadius = 15
        view.layer.backgroundColor = UIColor.warmPink.cgColor
    }
    
    func deselectItem(view: UIView) {
        view.layer.cornerRadius = 0
        view.layer.backgroundColor = UIColor.white.cgColor
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        guard let tag  = sender?.view?.tag else {return}
        selectedItem = tag
        setupSelectedItem(selectedItem: tag)
    }
    
}
