//
//  StoriesVcData.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 09/11/2022.
//

import Foundation
import UIKit

extension StoriesVc {
    
    
    
    func getStories() {
        Authentication.shared.getStories {[weak self] response in
            guard let StrongSelf  = self else {return}
            if let data = response.data, response.result == true {
                StrongSelf.stories = data
                StrongSelf.storiesTableView.reloadData()
            } else {
                
            }
        }
    }
    
}
