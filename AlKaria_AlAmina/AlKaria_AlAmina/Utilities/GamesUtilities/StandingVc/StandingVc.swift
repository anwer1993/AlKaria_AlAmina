//
//  StandingVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 17/11/2022.
//

import Foundation
import UIKit

class StandingVc: UIViewController, SubViewConroller  {
    
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var subviewContainer: UIView!
    @IBOutlet weak var controlView: UIControl!
    @IBOutlet var containerView: UIView!
   
    var handleTapWhenDismiss: () -> Void = {}
    var topScore: [ScoreModel] = []  {
        didSet  {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        headerView.headerGradientColor(startColor: .aqua, endColor: .sky, cornerRadius: 20)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func initView() {
        closeBtn.imageView?.image = UIImage(systemName: "xmark.app")?.withRenderingMode(.alwaysTemplate)
        closeBtn.tintColor = .white
        controlView.addTarget(self, action: #selector(removeView(_:)), for: .touchUpInside)
        controlView.alpha = 0.5
        controlView.layer.backgroundColor = UIColor.gray.cgColor
        subviewContainer.layer.cornerRadius = 20.0
        subviewContainer.layer.backgroundColor = UIColor.white.cgColor
        headerView.layer.cornerRadius = 20.0
        headerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tableView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.layer.cornerRadius = 20.0
        tableView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    @objc func removeView(_ gesture: UIGestureRecognizer) {
        removeView()
    }
    
    @IBAction func closeBtnDidTapped(_ sender: Any) {
        removeView()
    }
    
    func removeView() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
}


extension StandingVc: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topScore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as? PlayerCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
}
