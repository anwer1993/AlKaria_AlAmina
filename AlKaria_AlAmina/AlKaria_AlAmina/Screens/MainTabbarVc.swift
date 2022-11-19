//
//  MainTabbarVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 08/11/2022.
//

import Foundation
import UIKit

class MainTabbarVc: UITabBarController, Storyboarded  {
    
    var customTabbarView: CustomTabbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 1
        let y: CGFloat  = UIDevice().hasNotch ? -10 : -20
        let frame = CGRect(x: 0, y: y, width: tabBar.bounds.width, height: tabBar.bounds.height + 50)
        customTabbarView = CustomTabbar(frame: frame)
        customTabbarView.backgroundColor = .white
        self.tabBar.addSubview(customTabbarView)
        tabBar.backgroundColor = .clear
        customTabbarView.didSelectItem = { selectedIndex in
            self.selectedIndex = selectedIndex
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customTabbarView.selectedItem = selectedIndex
    }
    
}
