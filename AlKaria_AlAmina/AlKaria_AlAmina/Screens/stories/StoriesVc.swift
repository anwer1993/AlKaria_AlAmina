//
//  StoriesVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 08/11/2022.
//

import UIKit
import Lottie

class StoriesVc: UIViewController, Storyboarded {

    
    @IBOutlet weak var lottieView: LottieAnimationView!
    @IBOutlet weak var storiesTableView: UITableView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var polygoneIcon: UIImageView!
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var avatarIcon: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var viewprofileImage: UIView!
    @IBOutlet weak var containerView: UIView!
    
    var stories: [StorieModel] =  []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        getStories()
        getProfile(completion: {_ in 
        })
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        lottieView.setupLottieView()
    }
    
    func initView() {
        containerView.gradientColor(startColor: .offWhite, endColor: .paleSkyBlue)
        storiesTableView.delegate = self
        storiesTableView.dataSource = self
        storiesTableView.tableFooterView = UIView()
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

extension StoriesVc: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "StoriesTableViewCell", for: indexPath) as? StoriesTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.delegate = self
        cell.setupCell(model: stories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension StoriesVc: LireStoryDelegate {
    
    func lireStory(story: StorieModel) {
        Router.shared.present(screen: .LireStory(url: story.pdfLink2 ?? ""), modalePresentatioinStyle: .fullScreen, completion: nil)
    }
    
}
