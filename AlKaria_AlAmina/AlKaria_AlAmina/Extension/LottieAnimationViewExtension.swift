//
//  LottieAnimationViewExtension.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 09/11/2022.
//

import Foundation
import Lottie
import UIKit

extension LottieAnimationView {
    
    func setupLottieView(animation: String = "bird1") {
        let animationView = LottieAnimationView.init(name: animation)
        animationView.frame = self.bounds
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        self.subviews.forEach { view in
            view.removeFromSuperview()
        }
        self.addSubview(animationView)
        animationView.play()
    }
}
